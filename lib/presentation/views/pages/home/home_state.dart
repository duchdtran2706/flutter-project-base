import 'package:flutter_project_base/presentation/base/base_state.dart';

class HomeState extends BaseState {
  HomeState(
      {super.pageStatus = PageStatus.loaded,
      super.processing = false,
      super.errorEntity});

  @override
  // TODO: implement copyWith
  BaseState get copyWith => throw UnimplementedError();
}
