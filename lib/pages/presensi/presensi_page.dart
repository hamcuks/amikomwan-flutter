import 'dart:developer';

import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PresensiPage extends StatefulWidget {
  const PresensiPage({Key? key}) : super(key: key);

  @override
  _PresensiPageState createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  String? result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BarcodeCamera(
      types: [BarcodeType.ean8, BarcodeType.ean13, BarcodeType.code128],
      resolution: Resolution.hd720,
      framerate: Framerate.fps30,
      mode: DetectionMode.pauseDetection,
      onScan: (result) => log(result.toString()),
      children: [
        MaterialPreviewOverlay(
          animateDetection: false,
        ),
        BlurPreviewOverlay(),
        Positioned(
            child: ElevatedButton(
          onPressed: () => CameraController.instance.resumeDetector(),
          child: Text('Resume'),
        ))
      ],
    ));
  }
}
