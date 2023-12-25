import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/feuters/home/data/home_repo/home_repo_impl.dart';
import 'package:movies_app/feuters/home/data/model/movie_detail/movie_detail.dart';
part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.homeRepoImpl) : super(MovieDetailsInitial());
  HomeRepoImpl homeRepoImpl;
  Future<void> getSingle({String? id, String? title}) async {
    emit(MovieDetailsLoading());
    print('cubit start');
    var result = await homeRepoImpl.getSingle(id: id, title: title);
    result.fold(
      (failure) => emit(
        MovieDetailsFailure(failure.errMessage),
      ),
      (movie) => emit(
        MovieDetailsSucsess(movie),
      ),
    );
  }
}
