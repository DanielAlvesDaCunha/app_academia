import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<User?> signInWithEmailPassword(String email, String password);
  Future<void> signOut();
  Future<void> registerWithEmailPassword(String email, String password);
  Future<bool> isAuthenticated();
  Future<String?> getCurrentUserId();
}
