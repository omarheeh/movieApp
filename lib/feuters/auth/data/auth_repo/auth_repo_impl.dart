import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/serves/firebase_auth_serves.dart';
import 'package:movies_app/core/serves/firebase_firestore_serves.dart';
import 'package:movies_app/feuters/auth/data/auth_repo/auth_repo.dart';
import 'package:movies_app/feuters/auth/data/models/user_model.dart';

class AuthRepoImpl extends AuthRepo {
  final FireBaseAuthServes fireBaseAuthServes;
  final FirebaseFirestoreServes firebaseFirestoreServes;
  AuthRepoImpl(this.fireBaseAuthServes, this.firebaseFirestoreServes);
  @override
  Future<Either<Failure, UserModel>> singup({
    required String emailAddress,
    required String password,
    required String firstName,
    required String lastName,
    required String avatar,
  }) async {
    try {
      UserCredential userCredential = await fireBaseAuthServes.singup(
        emailAddress: emailAddress,
        password: password,
      );

      await firebaseFirestoreServes.post(collection: 'users', body: {
        'id': userCredential.user!.uid,
        'username': '$firstName$lastName',
        'email': emailAddress,
        'image': avatar,
      });

      return right(
        UserModel(
          email: emailAddress,
          avatar: avatar,
          userName: '$firstName$lastName',
          id: userCredential.user!.uid,
        ),
      );
    } catch (e) {
      return left(FireBaseFailure('error in regester'));
    }
  }

  @override
  Future<Either<FireBaseFailure, UserModel>> singin(
      {required String emailAddress, required String password}) async {
    try {
      UserCredential userCredential = await fireBaseAuthServes.singin(
        emailAddress: emailAddress,
        password: password,
      );

      Map<String, dynamic> user = await firebaseFirestoreServes.getUser(
        collection: 'users',
        emailAddress: emailAddress,
      );

      return right(UserModel(
        email: emailAddress,
        avatar: user['image'],
        userName: user['username'],
        id: userCredential.user!.uid,
      ));
    } catch (e) {
      return left(FireBaseFailure('error in sing in'));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      return right(await fireBaseAuthServes.signOut());
    } catch (e) {
      return left(FireBaseFailure('log out failure'));
    }
  }
}
