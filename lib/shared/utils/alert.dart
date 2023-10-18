import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

enum AppAlertType { success, error, warning, confirm, info, loading }

@singleton
class AppAlertDialog {
  void show(
    BuildContext context, {
    String message = '',
    AppAlertType type = AppAlertType.info,
    bool barrierDismissible = false,
    VoidCallback? onConfirmBtnTap,
    VoidCallback? onCancelBtnTap,
  }) {
    final coolAlertType = switch (type) {
      AppAlertType.success => CoolAlertType.success,
      AppAlertType.error => CoolAlertType.error,
      AppAlertType.warning => CoolAlertType.warning,
      AppAlertType.confirm => CoolAlertType.confirm,
      AppAlertType.info => CoolAlertType.info,
      AppAlertType.loading => CoolAlertType.loading,
    };
    CoolAlert.show(
      context: context,
      type: coolAlertType,
      text: message,
      onConfirmBtnTap: onConfirmBtnTap,
      onCancelBtnTap: onCancelBtnTap,
      barrierDismissible: type != AppAlertType.loading && barrierDismissible,
    );
  }

  void hide(BuildContext context) {
    Navigator.of(context).pop();
  }
}
