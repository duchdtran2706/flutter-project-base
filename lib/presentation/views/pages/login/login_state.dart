import 'package:flutter_project_base/presentation/base/base_state.dart';
import 'package:flutter_project_base/shared/common/error_entity.dart';
import 'package:flutter_project_base/shared/common/validation_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState extends BaseState with _$LoginState {
   factory LoginState({
    @Default(PageStatus.loaded) PageStatus pageStatus,
    @Default(false) bool processing,
    @Default(null) ErrorEntity? errorEntity,
    @Default(ValidationModel(key: 'username'))
    ValidationModel<String> username,
    @Default(ValidationModel(key: 'password'))
    ValidationModel<String> password,
    @Default(false) bool isRemember,
  }) = _LoginState;
}
