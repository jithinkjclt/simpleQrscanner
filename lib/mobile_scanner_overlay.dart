import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerWithOverlay extends StatelessWidget {
  const BarcodeScannerWithOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Scanner with Overlay'),
      ),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (barcodeCapture) {
              final List<Barcode> barcodes = barcodeCapture.barcodes;
              for (final barcode in barcodes) {
                debugPrint('Barcode found: ${barcode.rawValue}');
              }
            },
          ),
          Positioned(
            top: 100,
            left: 100,
            right: 100,
            bottom: 100,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
