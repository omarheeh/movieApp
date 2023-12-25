import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/feuters/home/data/home_repo/home_repo_impl.dart';
import 'package:movies_app/feuters/home/data/model/movie_model.dart';

part 'grid_movei_state.dart';

class GridMoveiCubit extends Cubit<GridMoveiState> {
  GridMoveiCubit(this.homeRepoImpl) : super(GridMoveiInitial());
  HomeRepoImpl homeRepoImpl;
  //page count
  int page = 1;
  //list content all movies
  List<MovieModel> movies = [];
  //count movies in api
  double count = 0;

  Future<void> getMoviesOnLoadingPage() async {
    emit(GridMoveiLading());
    var result = await homeRepoImpl.getFilms();
    result.fold(
      (failure) => emit(
        GridMoveiFailure(failure.errMessage),
      ),
      (moviesList) {
        movies = moviesList;
        setCount();
        emit(GridMoveiSucsess());
      },
    );
  }

  Future<void> getMoviesOnScroll() async {
    if (page < count) {
      page += 1;
      var result = await homeRepoImpl.getFilms(page: page);
      result.fold(
        (failure) => emit(
          GridMoveiFailure(failure.errMessage),
        ),
        (moviesList) {
          movies.addAll(moviesList);
          emit(GridMoveiSucsess());
        },
      );
    }
  }

  void setCount() {
    count = movies[0].count / 10;
  }
}
