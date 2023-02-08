import 'dart:developer';
import 'dart:typed_data';

import 'package:camera/camera.dart';

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
      for (var x = 0; x < targetWidth; x++) {
        for (var y = 0; y < targetHeight; y++) {
          final int yuvIndex =
              (y >= numCameraCols) ? numCameraCols - 1 : y * numCameraCols + x;
          final int rgbIndex = y * targetWidth + x;
          final rgbOffset = rgbIndex * 3;
          final yuvOffset = yuvIndex;
          rgbBytes[rgbOffset] = cameraBytes[yuvOffset]; // red
          rgbBytes[rgbOffset + 1] = cameraBytes[yuvOffset]; // green
          rgbBytes[rgbOffset + 2] = cameraBytes[yuvOffset]; // blue
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
