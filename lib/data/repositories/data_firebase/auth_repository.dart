import 'package:app_academia/domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception('Falha na autenticação: $e');
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<String?> getCurrentUserId() async {
    // Retorna o ID do usuário atual se ele estiver autenticado
    final user = _firebaseAuth.currentUser;
    return user?.uid;
  }

  @override
  Future<bool> isAuthenticated() async {
    // Retorna se o usuário está autenticado ou não
    final user = _firebaseAuth.currentUser;
    return user != null;
  }

  @override
  Future<void> registerWithEmailPassword(String email, String password) async {
    try {
      // Registra um novo usuário com o email e senha fornecidos
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw Exception('Erro ao registrar usuário: ${e.message}');
    }
  }
}
