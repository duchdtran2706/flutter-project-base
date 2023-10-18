import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_project_base/presentation/resources/locale_keys.dart';

class ErrorEntity implements Exception {
  ErrorEntity({required this.code, required this.message});

  final String code;
  final String message;

  @override
  String toString() {
    return '$runtimeType(code: $code, message: $message)';
  }
}

class ValidationError extends ErrorEntity {
  ValidationError({required String key, required this.type})
      : super(
          code: key,
          message: type.toString(),
        );

  final ValidationErrorType type;
}

enum ValidationErrorType {
  fieldEmpty,
  none;

  const ValidationErrorType();

  @override
  String toString() {
    return switch (this) {
      fieldEmpty => LocaleKeys.error_field_is_required.tr(),
      none => LocaleKeys.error_server_error.tr(),
    };
  }
}
