import 'dart:ui' as painting;
import 'dart:io' as io;

import 'package:flutter/services.dart';

enum ImageFormat { rgba8888, yuv420 }

class TensorImage {
  TensorImage._(
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

  static Future<TensorImage> loadFromBundle({
    required String key,
    required ImageFormat inputFormat,
    required int targetWidth,
    required int targetHeight,
  }) async {
    // Extract the image file from the bundle
    final byteData = await rootBundle.load(key);
    final inputImageData = byteData.buffer.asUint8List();

    return _load(
      inputImageData: inputImageData,
      inputFormat: inputFormat,
      targetWidth: targetWidth,
      targetHeight: targetHeight,
    );
  }

  static Future<TensorImage> loadFromFile({
    required String path,
    required ImageFormat inputFormat,
    required int targetWidth,
    required int targetHeight,
  }) async {
    // Read in the image file
    Uint8List inputImageData = io.File(path).readAsBytesSync();

    return _load(
        inputImageData: inputImageData,
        inputFormat: inputFormat,
        targetWidth: targetWidth,
        targetHeight: targetHeight);
  }

  static Future<TensorImage> _load({
    required Uint8List inputImageData,
    required ImageFormat inputFormat,
    required int targetWidth,
    required int targetHeight,
  }) async {
    final paintableImage = await _convertDataToPaintableImage(
        inputImageData, targetWidth, targetHeight);

    final rgbData =
        await _extractRgbData(paintableImage, targetWidth * targetHeight);

    return TensorImage._(inputFormat, inputImageData, targetWidth, targetHeight,
        paintableImage, rgbData);
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

    // TODO: avoid axtra copy by using a Uint8List backed by C memory
    //  But can we only read C memory that way?
    //  If we can get hold of the original C memory maybe we could avoid the
    //  extra copy by manipulating the data with C?
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
