import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerReturningImage extends StatelessWidget {
  const BarcodeScannerReturningImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Scanner Returning Image'),
      ),
      body: MobileScanner(
        onDetect: (barcodeCapture) {
          final List<Barcode> barcodes = barcodeCapture.barcodes;
          final image = barcodeCapture.image; // Returns the captured image
          // Process image if necessary
          for (final barcode in barcodes) {
            debugPrint('Barcode found: ${barcode.rawValue}');
          }
        },
      ),
    );
  }
}
