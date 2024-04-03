import 'dart:developer';
import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:mobile_bank_app/src/pages/test_page.dart';
import 'package:mobile_bank_app/src/widgets/btn_menu_qris.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:scanning_effect/scanning_effect.dart';

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
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Expanded(
              flex: 1,
              child: Text(
                'Scan QR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(
              Icons.house,
              color: Color.fromARGB(255, 255, 142, 44),
              size: 24,
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          // Background Color for the Title

          _buildQrView(context),
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Container(
              // Semi-transparent black background
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Center(
                  child: Center(
                    child: Text(
                      'Scan QR atau\nbarcode untuk memulai transaksi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/logo_qris.png',
                          width: 80,
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                await _controller?.toggleFlash();
                                setState(() {});
                              },
                              borderRadius: BorderRadius.circular(30.0),
                              child: Container(
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: FutureBuilder(
                                  future: _controller?.getFlashStatus(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      return Icon(
                                        snapshot.data == true
                                            ? Icons.flash_on
                                            : Icons.flash_off,
                                        color: Colors.orange,
                                        size: 22.0,
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: const Icon(
                                Icons.image_outlined,
                                color: Colors.orange,
                                size: 22.0,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
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
    return ScanningEffect(
      scanningColor: const Color.fromARGB(255, 249, 118, 6),
      child: QRView(
        key: qrKey,
        onQRViewCreated: (QRViewController controller) {
          setState(() {
            _controller = controller;
          });
          controller.scannedDataStream.listen((val) {
            if (mounted) {
              if (val.code != null) {
                _controller!.dispose();
                // ResultScan result = ResultScan.fromJson(
                //     jsonDecode(val.code ?? '') as Map<String, dynamic>);

                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 600),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = const Offset(0.0, 1.0);
                      var end = Offset.zero;
                      var curve = Curves.ease;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const NewPage(),
                  ),
                );
                //Navigator.pop(context, val.code);
              }
            }
          }); // <-- Added missing semicolon here
        },
      ),
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
