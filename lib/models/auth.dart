import 'package:firebase_auth/firebase_auth.dart';
import 'package:nande_french_translator/interfaces/auth_interface.dart';

class Auth implements AuthInterface {
  final firebaseAuth = FirebaseAuth.instance;
  static final Auth instance = Auth._();

  Auth._();
  factory Auth() {
    return instance;
  }

  @override
  Future<void> createUser(
      {required String email, required String password}) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    await firebaseAuth.currentUser?.sendEmailVerification();
  }

  @override
  Future<UserCredential> loginUser(
      {required String email, required String password}) async {
    return await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }
}
