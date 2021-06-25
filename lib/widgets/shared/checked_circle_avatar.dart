import 'dart:async';

import 'package:flutter/material.dart';

/// A widget that precaches the NetworkImage part of a CircleAvatar, checks for
/// any errors and if found, returns a widget that indicates something went
/// wrong.
class CheckedCircleAvatar extends StatelessWidget {
  final String _url;
  final double _radius;
  const CheckedCircleAvatar(
      {required String url, required double radius, Key? key})
      : _url = url,
        _radius = radius,
        super(key: key);
  Future<bool> cacheImage(String url, BuildContext context) async {
    var hasNoError = true;
    var output = Completer<bool>();
    await precacheImage(
      NetworkImage(_url),
      context,
      onError: (e, stackTrace) => hasNoError = false,
    );
    output.complete(hasNoError);
    return output.future;
  }

  @override
  Widget build(context) {
    return FutureBuilder(
      future: cacheImage(_url, context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none ||
            snapshot.hasError) {
          return const ErrorAvatar();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            decoration: const BoxDecoration(color: Colors.grey),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.data == false) {
          return const ErrorAvatar();
        }
        return CircleAvatar(
            radius: _radius, backgroundImage: Image.network(_url).image);
      },
    );
  }
}

class ErrorAvatar extends StatelessWidget {
  const ErrorAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      decoration: const BoxDecoration(color: Colors.grey),
      child: const Center(
        child: Text(
          'Error',
        ),
      ),
    );
  }
}
