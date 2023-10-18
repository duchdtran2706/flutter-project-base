import 'package:flutter_project_base/domain/usecase/login_use_case.dart';
import 'package:flutter_project_base/presentation/base/base_cubit.dart';
import 'package:flutter_project_base/presentation/views/pages/login/login_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends BaseCubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginState());

  final LoginUseCase _loginUseCase;

  @override
  Future<void> initData() async {
    await Future.delayed(const Duration(seconds: 1));
    return super.initData();
  }

  void updateUsername(String? username) {
    emit(state.copyWith.username(value: username));
  }

  void updatePassword(String? password) {
    emit(state.copyWith.password(value: password));
  }

  void updateRememberMe(bool isRememberMe) {
    emit(state.copyWith(isRemember: isRememberMe));
  }

  Future<void> login() async {
    await launch(() async {
      final param = LoginParam(
        username: state.username,
        password: state.password,
      );
      await _loginUseCase.invoke(param);
    });
  }
}
