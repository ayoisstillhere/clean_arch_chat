abstract class FirebaseRepository {
  Future<void> signUp(String email, String password);
  Future<void> signIn(String email, String password);
  Future<bool> isSignIn();
  Future<String> getCurrentUid();
  Future<void> getCreateCurrentUser(
      String email, String name, String profileUrl);
}