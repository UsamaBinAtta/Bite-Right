import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  runApp(MyApp(camera: firstCamera));
}

class MyApp extends StatelessWidget {
  final CameraDescription camera;

  MyApp({required this.camera});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(camera: camera),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final CameraDescription camera;

  MyHomePage({required this.camera});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CameraController? _controller;
  String ingredientsSection = "Capture an image to analyze.";

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  Future<void> processImage() async {
    if (!_controller!.value.isInitialized) {
      return;
    }

    try {
      // final image = await _controller!.takePicture();
      // final imageFile = image.path;
      // final visionImage = FirebaseVisionImage.fromFilePath(imageFile);
      // final textRecognizer = FirebaseVision.instance.textRecognizer();

      // final visionText = await textRecognizer.processImage(visionImage);
      // final extractedText = visionText.text;

      // if (extractedText!.contains("Ingredients") ||
      //     extractedText!.contains("INGREDIENTS")) {
      //   setState(() {
      //     ingredientsSection = "Ingredients section found.";
      //   });
      // } else {
      //   setState(() {
      //     ingredientsSection = "Ingredients section not found.";
      //   });
      // }

      // textRecognizer.close();
    } catch (e) {
      print("Error processing image: $e");
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller!.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(title: Text('Live OCR Example')),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: CameraPreview(_controller!),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: processImage,
              child: Text('Capture and Analyze'),
            ),
            SizedBox(height: 20),
            Text(ingredientsSection),
          ],
        ),
      ),
    );
  }
}

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  late XFile _image;
  final imagepicker = ImagePicker();
  String ingredientsSection = "Capture an image to analyze.";

  detectimage(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    final extractedText = recognizedText.text;
    setState(() {
      ingredientsSection = extractedText;
    });
  }

  pickimage_gallery() async {
    var image = await imagepicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    } else {
      _image = XFile(image.path);
    }
    detectimage(_image);
  }

  @override
  Widget build(BuildContext context) {
    // Your UI code for the ScanPage goes here
    return Scaffold(
      appBar: AppBar(title: Text('Scan Page')),
      body: Center(
        child: Column(children: [
          ElevatedButton(
            onPressed: () {
              pickimage_gallery();
            },
            child: Column(
              children: [
                Text('Open Gallery'),
              ],
            ),
          ),
          Text(ingredientsSection)
        ]),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: Scaffold(
        appBar: AppBar(title: Text('My App')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Home Page'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ScanPage()), // Navigate to the ScanPage
                  );
                },
                child: Text('Go to Scan Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
