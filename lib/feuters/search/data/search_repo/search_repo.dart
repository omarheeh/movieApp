import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/feuters/home/data/model/movie_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MovieModel>>> search(
      {int page = 1, String search = ''});
}
