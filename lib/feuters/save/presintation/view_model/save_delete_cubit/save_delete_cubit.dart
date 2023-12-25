import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/feuters/save/data/save_ropo/save_repo_impl.dart';

part 'save_delete_state.dart';

class SaveDeleteCubit extends Cubit<SaveDeleteState> {
  SaveRepoImpl saveRepoImpl;
  SaveDeleteCubit(this.saveRepoImpl) : super(SaveDeleteInitial());
  Future<void> isSaved(String id, String userEmail) async {
    emit(SaveButtonLoading());
    var result = await saveRepoImpl.getMovie(userEmail: userEmail);
    result.fold((failure) {
      return false;
    }, (moves) {
      var data = moves.where((row) => (row.movieId == id));
      if (data.length >= 1) {
        emit(SaveButtonSaved());
      } else {
        emit(SaveButtonNotSaved());
      }
    });
  }
}
