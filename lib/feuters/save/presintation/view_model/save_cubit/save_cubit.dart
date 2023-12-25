import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/feuters/save/data/models/save_model.dart';
import 'package:movies_app/feuters/save/data/save_ropo/save_repo_impl.dart';

part 'save_state.dart';

class SaveCubit extends Cubit<SaveState> {
  SaveRepoImpl saveRepoImpl;
  SaveCubit(this.saveRepoImpl) : super(SaveInitial());
  Future<void> getMovies(String uesrEmail) async {
    emit(SaveLoading());
    var result = await saveRepoImpl.getMovie(userEmail: uesrEmail);
    result.fold((failure) => emit(SaveFailure(failure.errMessage)),
        (moves) => emit(SaveSucsess(moves)));
  }

  Future<void> saveMovies(String id, String userEmail) async {
    await saveRepoImpl.saveMovie(id: id, userEmail: userEmail);
  }

  Future<void> deleteMovies(String id, String userEmail) async {
    await saveRepoImpl.deleteMovie(id: id, userEmail: userEmail);
  }
}
