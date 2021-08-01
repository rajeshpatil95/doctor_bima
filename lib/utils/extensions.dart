import 'mock_server.dart';

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';

  String get allInCaps => this.toUpperCase();

  String get capitalizeFirstofEach =>
      this.trimExtraSpace.split(" ").map((str) => str.inCaps).join(" ");

  /// Replace String with one space if it contain more than  one space.
  String get trimExtraSpace => this.replaceAll(RegExp(r"\s+"), ' ');
}

extension Decimal on num {
  double get toDecimal => double.parse(this.toStringAsFixed(1));
}

extension CallBackDelayExtension on CallBackDelay {
  int get delay {
    switch (this) {
      case CallBackDelay.CALLBACK_DELAY_NONE:
        return 0;
      case CallBackDelay.CALLBACK_DELAY_SHORT:
        return 2000;
      case CallBackDelay.CALLBACK_DELAY_MEDIUM:
        return 5000;
      case CallBackDelay.CALLBACK_DELAY_LONG:
        return 10000;
      default:
        return 1000;
    }
  }
}
