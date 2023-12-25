import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/serves/api_serves.dart';
import 'package:movies_app/feuters/home/data/model/movie_model.dart';
import 'package:movies_app/feuters/search/data/search_repo/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  ApiServes apiServes;
  SearchRepoImpl(this.apiServes);
  @override
  Future<Either<Failure, List<MovieModel>>> search(
      {int page = 1, String search = ''}) async {
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
}
