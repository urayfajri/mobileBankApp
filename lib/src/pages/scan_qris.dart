import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/widgets/btn_menu_qris.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanQris extends StatefulWidget {
  const ScanQris({super.key});

  @override
  State<StatefulWidget> createState() => _ScanQrisPage();
}

class _ScanQrisPage extends State<ScanQris> {
  Barcode? result;
  QRViewController? controller;
  QRViewController? _controller;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildQrView(context),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/logo_qris.png',
                        width: 80,
                      ),
                      InkWell(
                        onTap: () async {
                          await _controller?.toggleFlash();
                          setState(() {});
                        },
                        borderRadius: BorderRadius.circular(
                            30.0), // Mengatur sudut menjadi full rounded
                        child: Container(
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            color: Colors.white, // Warna background button
                            borderRadius: BorderRadius.circular(
                                30.0), // Mengatur sudut menjadi full rounded
                          ),
                          child: FutureBuilder(
                            future: _controller?.getFlashStatus(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return Icon(
                                  snapshot.data == true
                                      ? Icons.flash_on
                                      : Icons.flash_off,
                                  color: Colors.orange,
                                  size: 18.0,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const BtnMenuQris()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.

    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
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
      },
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
