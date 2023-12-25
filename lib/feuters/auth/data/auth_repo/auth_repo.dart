import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/feuters/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> singup({
    required String emailAddress,
    required String password,
    required String firstName,
    required String lastName,
    required String avatar,
  });

  Future<Either<FireBaseFailure, UserModel>> singin({
    required String emailAddress,
    required String password,
  });
  Future<Either<Failure, void>> signOut();
}
