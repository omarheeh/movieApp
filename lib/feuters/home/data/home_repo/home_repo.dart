import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/feuters/home/data/model/movie_detail/movie_detail.dart';
import 'package:movies_app/feuters/home/data/model/movie_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<MovieModel>>> getNews();
  Future<Either<Failure, List<MovieModel>>> getFilms(
      {int page = 1, String search = 'movie'});
  Future<Either<Failure, MovieDetail>> getSingle({String? id, String? title});
}
