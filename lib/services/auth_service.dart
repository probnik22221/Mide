

import '../ models/user.dart';

abstract class AuthService {
  Future<User?> signInWithEmail(String email, String password);
  Future<User?> registerWithEmail(String name, String email, String password);
  Future<User?> getCurrentUser();
  Future<void> signOut();
  Future<void> updateUserLanguage(String language);
  Future<void> sendPasswordResetEmail(String email);
}
