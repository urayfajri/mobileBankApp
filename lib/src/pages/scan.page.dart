import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
// import 'package:qr_code_scanner/qr_scanner_overlay_shape_.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final GlobalKey _qrKey = GlobalKey();
  bool _flashOn = false;
  bool _frontCam = false;
  QRViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('QRIS'),
          centerTitle: true, // Center the title horizontally
          backgroundColor: Colors.white, // Set background color to white
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.blue,
            ),
            QRView(
                key: _qrKey,
                onQRViewCreated: (QRViewController controller) {
                  setState(() {
                    _controller = controller;
                  });
                  controller.scannedDataStream.listen((val) {
                    if (mounted) {
                      // print(val.code);
                      _controller!.dispose();
                      //Navigator.pop(context, val.code);
                    }
                  });
                }),
            Align(
              alignment: Alignment.bottomCenter,
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          _frontCam = !_frontCam;
                        });
                        _controller!.flipCamera();
                      },
                      icon: Icon(
                          _frontCam ? Icons.camera_front : Icons.camera_rear)),
                  IconButton(
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          _flashOn = !_flashOn;
                        });
                        _controller!.toggleFlash();
                      },
                      icon: Icon(_flashOn ? Icons.flash_on : Icons.flash_off)),
                ],
              ),
            )
          ],
        ));
  }
}
