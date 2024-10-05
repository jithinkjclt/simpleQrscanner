import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerWithScanWindow extends StatelessWidget {
  const BarcodeScannerWithScanWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Scanner with Scan Window'),
      ),
      body: MobileScanner(
        scanWindow: const Rect.fromLTWH(50, 150, 300, 300),
        onDetect: (barcodeCapture) {
          final List<Barcode> barcodes = barcodeCapture.barcodes;
          for (final barcode in barcodes) {
            debugPrint('Barcode found: ${barcode.rawValue}');
          }
        },
      ),
    );
  }
}
