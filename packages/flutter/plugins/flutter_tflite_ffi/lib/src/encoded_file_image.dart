import 'dart:ui' as painting;
import 'dart:io' as io;

import 'package:flutter/services.dart';

/// The `camera` plugin has [ImageFormatGroup] with:
///    - `unknown`, `yuv420`, `bgra8888`, `jpeg`,
enum ImageFormat { rgba8888, bgra8888, yuv420 }

/// An [EncodedFileImage] takes a [path] (for a file) or a [key] (for a bundle)
/// and
///  - decodes the corresponding image
///  - creates [rgbData] in [ImageFormat.rgb888] format
///  - a [ui.Image] is created along the way and stored as the [paintableImage]
///    member, in order to be accessible for displaying with Flutter.

/// The [rgbData] can be passed to an [Interpreter.setInputTensorData] to set a
/// tensor's data.
///
/// Create an [EncodedFileImage] with one of
///  - [EncodedFileImage.loadFromBundle]
///  - [EncodedFileImage.loadFromFile]
///
class EncodedFileImage {
  EncodedFileImage._(
    ImageFormat inputFormat,
    Uint8List inputImageData,
    this.targetWidth,
    this.targetHeight,
    painting.Image image,
    Uint8List rgbData,
  )   : _rgbData = rgbData,
        _paintableImage = image;

  final int targetWidth;
  final int targetHeight;
  final Uint8List _rgbData;
  final painting.Image _paintableImage;

  int get numPixels => targetWidth * targetHeight;
  Uint8List get rgbData => _rgbData;
  painting.Image get paintableImage => _paintableImage;

  static Future<EncodedFileImage> loadFromBundle({
    required String key,
    required ImageFormat inputFormat,
    required int targetWidth,
    required int targetHeight,
  }) async {
    // Extract the image file from the bundle
    final byteData = await rootBundle.load(key);
    final inputImageData = byteData.buffer.asUint8List();

    return _createImage(
      inputImageData: inputImageData,
      inputFormat: inputFormat,
      targetWidth: targetWidth,
      targetHeight: targetHeight,
    );
  }

  static Future<EncodedFileImage> loadFromFile({
    required String path,
    required ImageFormat inputFormat,
    required int targetWidth,
    required int targetHeight,
  }) async {
    // Read in the image file
    Uint8List inputImageData = io.File(path).readAsBytesSync();

    return _createImage(
        inputImageData: inputImageData,
        inputFormat: inputFormat,
        targetWidth: targetWidth,
        targetHeight: targetHeight);
  }

  static Future<EncodedFileImage> _createImage({
    required Uint8List inputImageData,
    required ImageFormat inputFormat,
    required int targetWidth,
    required int targetHeight,
  }) async {
    final paintableImage = await _convertDataToPaintableImage(
        inputImageData, targetWidth, targetHeight);

    final rgbData =
        await _extractRgbData(paintableImage, targetWidth * targetHeight);

    return EncodedFileImage._(inputFormat, inputImageData, targetWidth,
        targetHeight, paintableImage, rgbData);
  }

  static Future<painting.Image> _convertDataToPaintableImage(
    Uint8List imageData,
    int imageWidth,
    int imageHeight,
  ) async {
    final painting.ImmutableBuffer buffer =
        await painting.ImmutableBuffer.fromUint8List(imageData);
    final painting.ImageDescriptor descriptor =
        await painting.ImageDescriptor.encoded(buffer);
    buffer.dispose();

    final codec = await descriptor.instantiateCodec(
      targetWidth: imageWidth,
      targetHeight: imageHeight,
    );
    painting.FrameInfo frameInfo = await codec.getNextFrame();

    return frameInfo.image;
  }

  static Future<Uint8List> _extractRgbData(
      painting.Image paintableImage, int numPixels) async {
    final rgbaByteData = (await paintableImage.toByteData(
        format: painting.ImageByteFormat.rawRgba))!;

    final rgbBytes = Uint8List(numPixels * 3);
    for (var i = 0; i < numPixels; i++) {
      final rgbOffset = i * 3;
      final rgbaOffset = i * 4;
      rgbBytes[rgbOffset] = rgbaByteData.getUint8(rgbaOffset); // red
      rgbBytes[rgbOffset + 1] = rgbaByteData.getUint8(rgbaOffset + 1); // green
      rgbBytes[rgbOffset + 2] = rgbaByteData.getUint8(rgbaOffset + 2); // blue
    }

    return rgbBytes;
  }
}
