import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_bank_app/src/models/result_scan.model.dart';
import 'package:mobile_bank_app/src/pages/transaction.page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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
          flexibleSpace: Container(
            margin: const EdgeInsets.only(top: 30),
            child: Center(
              child: Image.asset(
                'assets/images/qris_logo.png',
                height: 30, // Adjust the height as needed
              ),
            ),
          ),
          backgroundColor: Colors.white, // Set background color to white
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              color: Colors.grey, // Choose your desired icon
              onPressed: () {
                // Add your onPressed logic here
              },
            ),
          ],
        ),
        body: Stack(
          children: <Widget>[
            QRView(
                key: _qrKey,
                onQRViewCreated: (QRViewController controller) {
                  setState(() {
                    _controller = controller;
                  });
                  controller.scannedDataStream.listen((val) {
                    if (mounted) {
                      if (val.code != null) {
                        _controller!.dispose();
                        ResultScan result = ResultScan.fromJson(
                            jsonDecode(val.code ?? '') as Map<String, dynamic>);

                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 600),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
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
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      TransactionPage(
                                resultScan: result,
                              ),
                            ));
                        //Navigator.pop(context, val.code);
                      }
                    }
                  });
                }),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _frontCam = !_frontCam;
                          });
                          _controller!.flipCamera();
                        },
                        child:
                            _buildMenuIcon(Icons.photo_library, Colors.white)),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _flashOn = !_flashOn;
                          });
                          _controller!.toggleFlash();
                        },
                        child: _buildMenuIcon(
                            _flashOn
                                ? Icons.flashlight_on
                                : Icons.flashlight_off,
                            Colors.white))
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget _buildMenuIcon(IconData iconData, Color iconBackgroundColor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(iconData,
                size: 24, color: const Color.fromARGB(255, 70, 70, 70)),
          ),
        ),
      ],
    );
  }

  // ignore: unused_element
  Future _openScanPage(BuildContext context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (c) => const ScanPage()));
  }
}
