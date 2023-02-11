import 'dart:developer';
import 'dart:typed_data';

import 'package:camera/camera.dart';

extension CameraImageExt on CameraImage {
  static int _count = 0;

  InferenceInput toInferenceInput(
      {required int targetWidth, required int targetHeight}) {
    int numPixels = targetWidth * targetHeight;
    final rgbBytes = Uint8List(numPixels * 3);
    if (format.group == ImageFormatGroup.bgra8888) {
      Plane plane = planes.first;
      Uint8List cameraBytes = plane.bytes;
      int numCameraBytes = planes.first.bytes.length;
      int numCameraRows = numCameraBytes ~/ planes.first.bytesPerRow;
      int numCameraCols = planes.first.bytesPerRow ~/ 4;
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
      Uint8List cameraImageBytes = planes.first.bytes;
      int cameraImageHeightInPixels =
          cameraImageBytes.length ~/ planes.first.bytesPerRow;
      int cameraImageWidthInPixels = planes.first.bytesPerRow;

      if (_count == 0) {
        _count++;
        log('cameraImage = $cameraImageWidthInPixels x $cameraImageHeightInPixels = ${cameraImageWidthInPixels * cameraImageHeightInPixels} pixels = ${cameraImageBytes.length} bytes');
      }

      // if camera image is smaller we leave bytes as zero (which results in black padding)
      for (var x = 0; x < targetWidth; x++) {
        if (x >= cameraImageWidthInPixels) break;
        for (var y = 0; y < targetHeight; y++) {
          if (y >= cameraImageHeightInPixels) break;

          final brightness = cameraImageBytes[y * cameraImageWidthInPixels + x];
          final int rgbIndex = y * targetWidth + x;
          final rgbOffset = rgbIndex * 3;
          rgbBytes[rgbOffset] = brightness; // red
          rgbBytes[rgbOffset + 1] = brightness; // green
          rgbBytes[rgbOffset + 2] = brightness; // blue
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
