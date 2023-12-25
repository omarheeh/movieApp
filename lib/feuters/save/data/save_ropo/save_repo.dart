import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/feuters/save/data/models/save_model.dart';

abstract class SaveRepo {
  Future<Either<Failure, void>> saveMovie(
      {required String id, required String userEmail});
  Future<Either<Failure, void>> deleteMovie(
      {required String id, required String userEmail});
  Future<Either<Failure, List<SaveModel>>> getMovie(
      {required String userEmail});
}
