import 'package:flutter/material.dart';
import 'package:flutter_project_base/shared/utils/logger.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.isEnable = true,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isEnable;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (value) {
        logger.d('message $value');
        onChanged(value ?? false);
      },
    );
  }
}
