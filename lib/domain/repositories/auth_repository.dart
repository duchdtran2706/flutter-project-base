abstract interface class AuthRepository {
  Future login({required String username, required String password});
}