import 'package:flutter_project_base/shared/common/error_entity.dart';

abstract class BaseState with StateMixin {
  BaseState({
    required this.pageStatus,
    required this.processing,
    required this.errorEntity,
  });

  final PageStatus pageStatus;
  final bool processing;
  final ErrorEntity? errorEntity;
}

enum PageStatus {
  initial, loading, loaded, error
}

mixin StateMixin<S> {
  S get copyWith;
}
