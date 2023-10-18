import 'package:flutter_project_base/presentation/base/base_state.dart';
import 'package:flutter_project_base/shared/common/error_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_state.freezed.dart';

@freezed
class StartState extends BaseState with _$StartState {
  const factory StartState({
    @Default(PageStatus.loaded) PageStatus pageStatus,
    @Default(false) bool processing,
    @Default(null) ErrorEntity? errorEntity,
  }) = _StartState;
}