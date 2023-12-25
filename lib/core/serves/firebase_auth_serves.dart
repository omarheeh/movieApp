import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthServes {
  final FirebaseAuth firebaseAuth;
  FireBaseAuthServes(this.firebaseAuth);
  Future<UserCredential> singup(
      {required String emailAddress, required String password}) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    return credential;
  }

  Future<UserCredential> singin(
      {required String emailAddress, required String password}) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    return credential;
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
