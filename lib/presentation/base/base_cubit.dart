import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_base/shared/common/error_entity.dart';

import 'base_state.dart';

abstract class BaseCubit<S extends BaseState> extends Cubit<S> {
  BaseCubit(super.initialState);

  Future<T> launch<T>(
    Future<T> Function() future, {
    Future<T> Function(Object? error, StackTrace? stackTrace)? onError,
  }) async {
    try {
      emit(state.copyWith(processing: true, errorEntity: null));
      return await future();
    } catch (error, stackTrace) {
      emit(state.copyWith(processing: false));
      onError?.call(error, stackTrace) ?? handleError(error, stackTrace);
      return Future.error(error, stackTrace);
    }
  }

  void handleError(Object? error, [StackTrace? stackTrace]) {
    if (error is ErrorEntity) {
      emit(state.copyWith(errorEntity: error) as S);
    }
  }

  Future<void> initData() async {}

  Future<void> retry() async {
    await initData();
  }
}
