import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerListView extends StatelessWidget {
  const BarcodeScannerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Scanner ListView'),
      ),
      body: MobileScanner(
        onDetect: (barcodeCapture) {
          final List<Barcode> barcodes = barcodeCapture.barcodes;
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Scanned Codes'),
              content: Column(
                children: barcodes.map((barcode) {
                  return ListTile(
                    title: Text(barcode.rawValue ?? 'Unknown'),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
