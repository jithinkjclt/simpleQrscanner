import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrscanner/main.dart';
import 'package:qrscanner/result.dart';

class BarcodeScannerSimple extends StatelessWidget {
  BarcodeScannerSimple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Scanner Simple'),
      ),
      body: MobileScanner(
        scanWindowUpdateThreshold: 100,
        onDetect: (barcodeCapture) {
          final List<Barcode> barcodes = barcodeCapture.barcodes;
          for (final barcode in barcodes) {
            if (barcode.rawValue != null) {
              final String code = barcode.rawValue!;
              debugPrint('Barcode found: $code');
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Result(value: code)));
              // showDialog(
              //   context: context,
              //   builder: (context) => AlertDialog(
              //     title: const Text('Scanned Code'),
              //     content: Text(code),
              //     actions: [
              //       InkWell(
              //           onTap: () {
              //             Navigator.of(context).pushReplacement(
              //                 MaterialPageRoute(
              //                     builder: (context) => const MyHome()));
              //           },
              //           child: const Text("OK"))
              //     ],
              //   ),
              // );
            } else {
              debugPrint('Failed to scan the barcode.');
            }
          }
        },
      ),
    );
  }
}
