import 'package:freezed_annotation/freezed_annotation.dart';

import 'error_entity.dart';

part 'validation_model.freezed.dart';

@Freezed(genericArgumentFactories: true)
class ValidationModel<V> with _$ValidationModel<V> {
  const factory ValidationModel({
    required String key,
    V? value,
  }) = _ValidationModel;
}

extension ValidationModelExtension on ValidationModel {
  ErrorEntity? checkInputIsRequired() {
    if (value is String) {
      final stringValue = value as String;
      if (stringValue.isEmpty) {
        return ValidationError(key: key, type: ValidationErrorType.fieldEmpty);
      }
    } else if (value is List) {
      final list = value as List;
      if (list.isEmpty) {
        return ValidationError(key: key, type: ValidationErrorType.fieldEmpty);
      }
    } else if (value == null) {
      return ValidationError(key: key, type: ValidationErrorType.fieldEmpty);
    }
    return null;
  }
}