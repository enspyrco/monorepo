import 'dart:developer';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:image/image.dart' as img;

extension CameraImageExt on CameraImage {
  static int _count = 0;

  InferenceInput toInferenceInput(
      {required int targetWidth, required int targetHeight}) {
    Plane plane = planes.first;
    Uint8List cameraBytes = plane.bytes;
    int numCameraBytes = planes.first.bytes.length;
    int numCameraRows = numCameraBytes ~/ planes.first.bytesPerRow;
    int numCameraCols = planes.first.bytesPerRow ~/ 4;

    if (_count == 10) {
      _count++;
      log('$numCameraRows x $numCameraCols = ${numCameraRows * numCameraCols} pixels = $numCameraBytes bytes');
    }

    int numPixels = targetWidth * targetHeight;
    final rgbBytes = Uint8List(numPixels * 3);
    if (format.group == ImageFormatGroup.bgra8888) {
      for (var x = 0; x < targetWidth; x++) {
        for (var y = 0; y < targetHeight; y++) {
          final int rgbaIndex = y * numCameraCols + x;
          final int rgbIndex = y * targetWidth + x;
          final rgbOffset = rgbIndex * 3;
          final rgbaOffset = rgbaIndex * 4;
          rgbBytes[rgbOffset] = cameraBytes[rgbaOffset + 2]; // red
          rgbBytes[rgbOffset + 1] = cameraBytes[rgbaOffset + 1]; // green
          rgbBytes[rgbOffset + 2] = cameraBytes[rgbaOffset]; // blue
        }
      }
    } else if (format.group == ImageFormatGroup.yuv420) {
      img.Image? image = convertYUV420toImageColor(this);

      ByteBuffer buffer = image!.buffer;
      Int8List inBytes = buffer.asInt8List();

      for (var x = 0; x < targetWidth; x++) {
        for (var y = 0; y < targetHeight; y++) {
          final int rgbaIndex = y * numCameraCols + x;
          final int rgbIndex = y * targetWidth + x;
          final rgbOffset = rgbIndex * 3;
          final rgbaOffset = rgbaIndex * 4;
          rgbBytes[rgbOffset] = inBytes[rgbaOffset + 2]; // red
          rgbBytes[rgbOffset + 1] = inBytes[rgbaOffset + 1]; // green
          rgbBytes[rgbOffset + 2] = inBytes[rgbaOffset]; // blue
        }
      }
    } else {
      throw UnsupportedError('$format is not supported.');
    }

    return InferenceInput(rgbBytes);
  }
}

class InferenceInput {
  InferenceInput(this.data);

  Uint8List data;
}

img.Image? convertYUV420toImageColor(CameraImage cameraImage) {
  const shift = (0xFF << 24);
  try {
    final int width = cameraImage.width;
    final int height = cameraImage.height;
    final int uvRowStride = cameraImage.planes[1].bytesPerRow;
    final int uvPixelStride = cameraImage.planes[1].bytesPerPixel!;

    print("uvRowStride: $uvRowStride");
    print("uvPixelStride: $uvPixelStride");

    // imgLib -> Image package from https://pub.dartlang.org/packages/image
    var image = img.Image(height: height, width: width); // Create Image buffer

    // Fill image buffer with plane[0] from YUV420_888
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        final int uvIndex =
            uvPixelStride * (x / 2).floor() + uvRowStride * (y / 2).floor();
        final int index = y * width + x;

        final yp = cameraImage.planes[0].bytes[index];
        final up = cameraImage.planes[1].bytes[uvIndex];
        final vp = cameraImage.planes[2].bytes[uvIndex];
        // Calculate pixel color
        int r = (yp + vp * 1436 / 1024 - 179).round().clamp(0, 255);
        int g = (yp - up * 46549 / 131072 + 44 - vp * 93604 / 131072 + 91)
            .round()
            .clamp(0, 255);
        int b = (yp + up * 1814 / 1024 - 227).round().clamp(0, 255);
        // color: 0x FF  FF  FF  FF
        //           A   B   G   R
        // image.data[index] = shift | (b << 16) | (g << 8) | r;
        if (image.isBoundsSafe(height - y, x)) {
          image.setPixelRgba(height - y, x, r, g, b, shift);
        }
      }
    }

    return image;
  } catch (e) {
    print(">>>>>>>>>>>> ERROR:$e");
  }
  return null;
}
