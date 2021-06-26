import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  final bool isAvailable;
  final String error;
  final String barcode;
  final bool stopScanner;

  BarcodeScannerStatus(
      {this.isAvailable = false,
      this.error = '',
      this.barcode = '',
      this.stopScanner = false});

  factory BarcodeScannerStatus.available() {
    return BarcodeScannerStatus(isAvailable: true, stopScanner: false);
  }

  factory BarcodeScannerStatus.error(String message) {
    return BarcodeScannerStatus(error: message);
  }

  factory BarcodeScannerStatus.barcode(String barcode) {
    return BarcodeScannerStatus(barcode: barcode);
  }

  bool get showCamera => isAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;

  BarcodeScannerStatus copywith({
    bool? isAvailable,
    String? error,
    String? barcode,
    bool? stopScanner,
    CameraController? cameraController,
  }) {
    return BarcodeScannerStatus(
      isAvailable: isAvailable ?? this.isAvailable,
      barcode: barcode ?? this.barcode,
      error: error ?? this.error,
      stopScanner: stopScanner ?? this.stopScanner,
    );
  }
}
