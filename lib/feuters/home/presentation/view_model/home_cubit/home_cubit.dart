import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/feuters/home/data/home_repo/home_repo_impl.dart';
import 'package:movies_app/feuters/home/data/model/movie_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepoImpl homeRepoImpl;
  HomeCubit(this.homeRepoImpl) : super(HomeInitial());
  Future<void> getNews() async {
    emit(HomeNewsLoading());
    var result = await homeRepoImpl.getNews();
    result.fold(
      (failure) => emit(
        HomeNewsFailure(failure.errMessage),
      ),
      (moveis) => emit(
        HomeNewsSucsess(moveis),
      ),
    );
  }
}
