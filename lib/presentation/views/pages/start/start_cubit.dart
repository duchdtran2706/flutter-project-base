import 'package:flutter_project_base/presentation/base/base_cubit.dart';
import 'package:flutter_project_base/presentation/views/pages/start/start_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class StartCubit extends BaseCubit<StartState> {
  StartCubit(): super(const StartState());

}