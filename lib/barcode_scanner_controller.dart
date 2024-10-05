import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerWithController extends StatefulWidget {
  const BarcodeScannerWithController({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerWithController> createState() => _BarcodeScannerWithControllerState();
}

class _BarcodeScannerWithControllerState extends State<BarcodeScannerWithController> {
  MobileScannerController cameraController = MobileScannerController();
  bool isTorchOn = false; // Manually track the torch state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Scanner with Controller'),
        actions: [
          IconButton(
            icon: Icon(isTorchOn ? Icons.flash_on : Icons.flash_off), // Change icon based on state
            onPressed: () {
              cameraController.toggleTorch();
              setState(() {
                isTorchOn = !isTorchOn; // Update the manual torch state
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.switch_camera),
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
        controller: cameraController,
        onDetect: (barcodeCapture) {
          final List<Barcode> barcodes = barcodeCapture.barcodes;
          for (final barcode in barcodes) {
            debugPrint('Barcode found: ${barcode.rawValue}');
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }
}
