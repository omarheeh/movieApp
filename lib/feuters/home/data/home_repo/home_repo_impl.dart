import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/serves/api_serves.dart';
import 'package:movies_app/feuters/home/data/home_repo/home_repo.dart';
import 'package:movies_app/feuters/home/data/model/movie_detail/movie_detail.dart';
import 'package:movies_app/feuters/home/data/model/movie_model.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiServes apiServes;
  HomeRepoImpl(this.apiServes);
  @override
  Future<Either<Failure, List<MovieModel>>> getNews() async {
    try {
      final year = await DateTime.now();
      var data = await apiServes.getAll(
        search: 'movie',
        page: 1,
        year: year.year.toString(),
      );
      List<dynamic> listData = data['Search'];
      List<MovieModel> movies = [];
      for (int i = 0; i < listData.length; i++) {
        movies.add(MovieModel.fromJsonData(
            listData[i], int.parse(data['totalResults'])));
      }
      return right(movies);
    } catch (e) {
      return left(ServerFailure('error in get data'));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getFilms(
      {int page = 1, String search = 'movie'}) async {
    try {
      var data = await apiServes.getAll(
        search: search,
        page: page,
      );
      List<dynamic> listData = data['Search'];
      List<MovieModel> movies = [];
      for (int i = 0; i < listData.length; i++) {
        movies.add(MovieModel.fromJsonData(
            listData[i], int.parse(data['totalResults'])));
      }
      return right(movies);
    } catch (e) {
      return left(ServerFailure('error on get all movies'));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getSingle(
      {String? id, String? title}) async {
    try {
      var data = await apiServes.gitSingle(id: id, title: title);
      MovieDetail movieDetail = MovieDetail.fromJsonData(data);
      return right(movieDetail);
    } catch (e) {
      return left(ServerFailure('error on get single movie'));
    }
  }
}
