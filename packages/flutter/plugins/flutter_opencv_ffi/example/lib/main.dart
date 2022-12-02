import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_opencv_ffi/flutter_opencv_ffi.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

const title = 'Native OpenCV Example';

late Directory tempDir;

String get tempPath => '${tempDir.path}/temp.jpg';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getTemporaryDirectory().then((dir) => tempDir = dir);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _picker = ImagePicker();

  bool _isProcessed = false;
  bool _isWorking = false;

  void showVersion() {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final snackbar = SnackBar(
      content: Text('OpenCV version: ${opencvVersion()}'),
    );

    scaffoldMessenger
      ..removeCurrentSnackBar(reason: SnackBarClosedReason.dismiss)
      ..showSnackBar(snackbar);
  }

  Future<String?> pickAnImage() async {
    if (Platform.isIOS || Platform.isAndroid) {
      return _picker
          .pickImage(
            source: ImageSource.gallery,
            imageQuality: 100,
          )
          .then((v) => v?.path);
    } else {
      return FilePicker.platform
          .pickFiles(
            dialogTitle: 'Pick an image',
            type: FileType.image,
            allowMultiple: false,
          )
          .then((v) => v?.files.first.path);
    }
  }

  Future<void> takeImageAndProcess() async {
    final imagePath = await pickAnImage();

    if (imagePath == null) {
      return;
    }

    setState(() {
      _isWorking = true;
    });

    // Creating a port for communication with isolate and arguments for entry point
    final port = ReceivePort();
    final args = ProcessImageArguments(imagePath, tempPath);

    // Spawning an isolate
    Isolate.spawn<ProcessImageArguments>(
      processImage,
      args,
      onError: port.sendPort,
      onExit: port.sendPort,
    );

    // Making a variable to store a subscription in
    late StreamSubscription sub;

    // Listening for messages on port
    sub = port.listen((_) async {
      // Cancel a subscription after message received called
      await sub.cancel();

      setState(() {
        _isProcessed = true;
        _isWorking = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(title)),
      body: Stack(
        children: <Widget>[
          Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                if (_isProcessed && !_isWorking)
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints(maxWidth: 3000, maxHeight: 300),
                    child: Image.file(
                      File(tempPath),
                      alignment: Alignment.center,
                    ),
                  ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: showVersion,
                      child: const Text('Show version'),
                    ),
                    ElevatedButton(
                      onPressed: takeImageAndProcess,
                      child: const Text('Process photo'),
                    ),
                  ],
                )
              ],
            ),
          ),
          if (_isWorking)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(.7),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
