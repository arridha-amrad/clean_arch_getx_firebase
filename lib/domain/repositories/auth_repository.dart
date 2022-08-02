import 'package:clean_arch/domain/core/exceptions/auth.exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  Future<UserCredential> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        throw AuthException("User not found");
      }
      if (e.code == "wrong-password") {
        throw AuthException("Invalid email and password");
      }
    } catch (e) {
      rethrow;
    }
    throw AuthException("Something went wrong");
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Future<void> sendEmailVerification() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw AuthException("Failed to get user");
    }
    await user.sendEmailVerification();
  }

  Future<UserCredential> register(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        throw AuthException("Email has been registered");
      }
      if (e.code == "operation-not-allowed") {
        throw AuthException("Sign in email and password currently disabled");
      }
      if (e.code == "weak-password") {
        throw AuthException("Password is too weak");
      }
    } catch (e) {
      rethrow;
    }
    throw AuthException("Something went wrong");
  }
}
