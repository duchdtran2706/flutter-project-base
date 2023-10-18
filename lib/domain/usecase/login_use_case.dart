import 'package:flutter_project_base/domain/repositories/auth_repository.dart';
import 'package:flutter_project_base/domain/usecase/use_case.dart';
import 'package:flutter_project_base/shared/common/error_entity.dart';
import 'package:flutter_project_base/shared/common/validation_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase extends UseCase<LoginParam, void> {
  LoginUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future invoke(LoginParam param) async {
    ErrorEntity? error;

    error ??= param.username.checkInputIsRequired();
    error ??= param.password.checkInputIsRequired();

    if (error != null) {
      throw error;
    }

    await _authRepository.login(
      username: param.username.value ?? '',
      password: param.password.value ?? '',
    );
  }
}

class LoginParam {
  LoginParam({required this.username, required this.password});

  final ValidationModel<String> username;
  final ValidationModel<String> password;
}
