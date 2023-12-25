import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/feuters/home/data/home_repo/home_repo_impl.dart';
import 'package:movies_app/feuters/home/data/model/movie_model.dart';

part 'known_movei_state.dart';

class KnownMoveiCubit extends Cubit<KnownMoveiState> {
  HomeRepoImpl homeRepoImpl;
  KnownMoveiCubit(this.homeRepoImpl) : super(KnownMoveiInitial());
  Future<void> getKnown({required String title}) async {
    emit(KnownMoveiLoading());
    var result = await homeRepoImpl.getFilms(search: title);
    result.fold(
      (failure) => emit(KnownMoveiFailure(failure.errMessage)),
      (moviesList) => emit(KnownMoveiSucsess(moviesList)),
    );
  }
}
