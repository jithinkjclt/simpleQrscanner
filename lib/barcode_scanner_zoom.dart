// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
//
// class BarcodeScannerWithZoom extends StatefulWidget {
//   const BarcodeScannerWithZoom({Key? key}) : super(key: key);
//
//   @override
//   State<BarcodeScannerWithZoom> createState() => _BarcodeScannerWithZoomState();
// }
//
// class _BarcodeScannerWithZoomState extends State<BarcodeScannerWithZoom> {
//   MobileScannerController cameraController = MobileScannerController();
//   double zoomLevel = 1.0; // Default zoom level
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Mobile Scanner with Zoom'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.switch_camera),
//             onPressed: () => cameraController.switchCamera(),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: MobileScanner(
//               controller: cameraController,
//               onDetect: (barcodeCapture) {
//                 final List<Barcode> barcodes = barcodeCapture.barcodes;
//                 for (final barcode in barcodes) {
//                   debugPrint('Barcode found: ${barcode.rawValue}');
//                 }
//               },
//             ),
//           ),
//           Slider(
//             min: 1.0,
//             max: 10.0,
//             value: zoomLevel,
//             onChanged: (value) {
//               setState(() {
//                 zoomLevel = value;
//                 cameraController.updateZoomScale(value); // Use updateZoomScale instead of setZoomLevel
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     cameraController.dispose();
//     super.dispose();
//   }
// }
