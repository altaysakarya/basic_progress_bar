import 'package:basic_progress_bar/utils/enums.dart';

class ProgressBarConfig {
  final ProgressBarConfigType type;
  final double? value;
  final double? currentValue;
  final double? maxValue;

  ProgressBarConfig.fixedValue({required this.value})
      : type = ProgressBarConfigType.fixedValue,
        currentValue = null,
        maxValue = null;

  ProgressBarConfig.calculatedValue({required this.currentValue, required this.maxValue})
      : type = ProgressBarConfigType.calculatedValue,
        value = null;

  double calculateValue() {
    switch (type) {
      case ProgressBarConfigType.fixedValue:
        return value ?? 0;
      case ProgressBarConfigType.calculatedValue:
        return ((currentValue ?? 0) / (maxValue ?? 1)) * 100;
      default:
        return 0;
    }
  }
}
