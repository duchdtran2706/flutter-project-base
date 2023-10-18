import 'package:flutter_project_base/presentation/base/base_cubit.dart';
import 'package:flutter_project_base/presentation/views/pages/home/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends BaseCubit<HomeState> {
  HomeCubit(): super(HomeState());
}