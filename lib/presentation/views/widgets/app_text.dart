import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    super.key,
    this.style,
    this.color,
  });

  final String data;
  final TextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final effectStyle = style ?? const TextStyle();
    return Text(
      data,
      style: effectStyle.copyWith(color: color),
    );
  }
}

extension AppTextExt on AppText {
  Widget tr() {
    return AppText(data.tr(), style: style);
  }
}
