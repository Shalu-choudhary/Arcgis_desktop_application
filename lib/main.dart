import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            InAppWebView(
              initialFile: "assets/map.html",
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton(
                heroTag: "zoomInBtn",
                backgroundColor: const Color.fromARGB(255, 246, 206, 246),
                onPressed: () {
                  webViewController.evaluateJavascript(source: "zoomIn();");
                },
                child: const Icon(Icons.zoom_in, size: 28),
              ),
            ),
            Positioned(
              bottom: 90,
              right: 20,
              child: FloatingActionButton(
                heroTag: "zoomOutBtn",
                backgroundColor: const Color.fromARGB(255, 244, 247, 136),
                onPressed: () {
                  webViewController.evaluateJavascript(source: "zoomOut();");
                },
                child: const Icon(Icons.zoom_out, size: 28),
              ),
            ),
            Positioned(
              bottom: 160,
              right: 20,
              child: FloatingActionButton(
                heroTag: "dropPinBtn",
                backgroundColor: const Color.fromARGB(255, 151, 244, 154),
                onPressed: () {
                  webViewController.evaluateJavascript(
                      source: "enablePinDrop();");
                },
                child: const Icon(Icons.pin_drop),
              ),
            ),
            Positioned(
              bottom: 230,
              right: 20,
              child: FloatingActionButton(
                heroTag: "clearPinsBtn",
                backgroundColor: const Color.fromARGB(255, 250, 160, 108),
                onPressed: () {
                  webViewController.evaluateJavascript(source: "clearPins();");
                },
                child: const Icon(Icons.delete),
              ),
            ),
            Positioned(
              bottom: 300,
              right: 20,
              child: FloatingActionButton(
                heroTag: "calcAllDistancesBtn",
                backgroundColor: const Color.fromARGB(255, 248, 168, 203),
                onPressed: () {
                  webViewController.evaluateJavascript(
                      source: "calculateAndDrawDistances();");
                },
                child: const Icon(Icons.timeline),
              ),
            )
          ],
        ),
      ),
    );
  }
}
