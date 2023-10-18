import 'package:flutter_project_base/domain/repositories/auth_repository.dart';
import 'package:flutter_project_base/shared/extensions/duration_extensions.dart';
import 'package:flutter_project_base/shared/extensions/int_extensions.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  @override
  Future login({required String username, required String password}) async {
    await 2.seconds.delay();
     // throw ErrorEntity(code: 'code', message: 'message');
  }
}