abstract interface class TokenProviderServiceInterface {
  Future<void> saveToken({required String name, required String token});
  String? getToken({required String name});
}
