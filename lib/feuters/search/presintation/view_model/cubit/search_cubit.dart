import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/feuters/home/data/model/movie_model.dart';
import 'package:movies_app/feuters/search/data/search_repo/search_repo_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepoImpl) : super(SearchInitial());
  SearchRepoImpl searchRepoImpl;
  int page = 1;
  double count = 0;
  List<MovieModel> movies = [];
  Future<void> searchOnSubit({required String search}) async {
    page = 1;
    emit(SearchLoading());
    var result = await searchRepoImpl.search(search: search);
    result.fold((failure) => emit(SearchFailure(failure.errMessage)),
        (moviesList) {
      movies = moviesList;
      setCount();
      emit(SearchSucsess());
    });
  }

  Future<void> searchOnScroll({required String search}) async {
    if (page < count) {
      page += 1;

      var result = await searchRepoImpl.search(search: search, page: page);
      result.fold((failure) => emit(SearchFailure(failure.errMessage)),
          (moviesList) {
        movies.addAll(moviesList);
        emit(SearchSucsess());
      });
    }
  }

  void setCount() {
    count = movies[0].count / 10;
  }
}
