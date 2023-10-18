import 'package:flutter/material.dart';
import 'package:flutter_project_base/shared/common/error_entity.dart';

abstract class ErrorHandler {
  static void handle(
    BuildContext context,
    Object? error, [
    StackTrace? stackTrace,
  ]) {
    String message = 'Something error';

    if (error is ErrorEntity) {
      message = error.message;
    }
    _showMyDialog(context, message);
  }
}

Future<void> _showMyDialog(BuildContext context, String message) async {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: SingleChildScrollView(child: Text(message)),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
