import 'dart:developer';
import 'dart:io';

import 'package:lottie/lottie.dart';

import '../../cubit/presensi/send_qr/send_qr_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../routes.dart';

class PresensiPage extends StatefulWidget {
  const PresensiPage({Key? key}) : super(key: key);

  @override
  _PresensiPageState createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  final GlobalKey _cameraKey = GlobalKey(debugLabel: 'QR SCANNER: ');
  bool isFrontCameraActive = false;
  bool isTorchActive = false;
  String code = '';

  QRViewController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    if (Platform.isIOS) {
      _controller?.resumeCamera();
    } else if (Platform.isAndroid) {
      _controller?.pauseCamera();
    }

    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          SizedBox.expand(
            child: QRView(
              key: _cameraKey,
              onQRViewCreated: (controller) {
                _controller = controller;
                controller.scannedDataStream.listen((data) {
                  log(data.format.toString());

                  code = data.code.toString();

                  controller.stopCamera();

                  context.read<SendQrCubit>().sendQr(code);
                  Navigator.of(context)
                      .pushReplacementNamed(Routes.presensiResult);
                });
                log(context.read<SendQrCubit>().state.toString());
              },
            ),
          ),
          const CameraOverlay(),
          Center(
            child: Opacity(
              opacity: 0.5,
              child: Lottie.asset('assets/json/scanner.json'),
            ),
          ),
          Positioned(
            top: 32,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(
                          CupertinoIcons.arrow_left,
                          color: Color(0xFFFAFAFA),
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Presensi',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFAFAFA),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: const Text(
                      'Arahkan kamera ke proyektor untuk memindai QR Code',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFFAFAFA),
                        height: 1.6,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 200),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              margin: const EdgeInsets.only(bottom: 32),
              decoration: BoxDecoration(
                color: const Color(0xFF442C79),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async {
                      await _controller?.flipCamera();
                      var _isFrontCamera = await _controller?.getCameraInfo() ==
                          CameraFacing.front;

                      isFrontCameraActive = _isFrontCamera;

                      setState(() {});
                    },
                    icon: Icon(
                      (isFrontCameraActive)
                          ? CupertinoIcons.switch_camera_solid
                          : CupertinoIcons.switch_camera,
                      color: const Color(0xFFFAFAFA),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      _controller?.toggleFlash();

                      var _isTorchActive = await _controller?.getFlashStatus();

                      isTorchActive = _isTorchActive!;
                    },
                    icon: Icon(
                      (isTorchActive)
                          ? CupertinoIcons.bolt_circle_fill
                          : CupertinoIcons.bolt_circle,
                      color: (isTorchActive)
                          ? const Color.fromARGB(255, 245, 176, 29)
                          : const Color(0xFFFAFAFA),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CameraOverlay extends StatelessWidget {
  const CameraOverlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: CustomPaint(
        painter: ScannerFramePainter(1),
      ),
    );
  }
}

class ScannerFramePainter extends CustomPainter {
  const ScannerFramePainter(this.aspectRatio);

  final double aspectRatio;

  static final backgroundPaint = Paint()..color = Colors.black54;
  @override
  void paint(Canvas canvas, Size size) {
    final screenRect = Rect.fromLTWH(0, 0, size.width, size.height);

    final cutOutWidth = screenRect.width - 100;
    final cutOutHeight = 1 / aspectRatio * cutOutWidth;
    final cutOut = RRect.fromRectXY(
        Rect.fromCenter(
            center: screenRect.center,
            width: cutOutWidth,
            height: cutOutHeight),
        12,
        12);

    final cutOutPath = Path.combine(PathOperation.difference,
        Path()..addRect(screenRect), Path()..addRRect(cutOut));

    canvas.drawPath(cutOutPath, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
