import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/serves/api_serves.dart';
import 'package:movies_app/core/serves/firebase_firestore_serves.dart';
import 'package:movies_app/feuters/save/data/models/save_model.dart';
import 'package:movies_app/feuters/save/data/save_ropo/save_repo.dart';

class SaveRepoImpl extends SaveRepo {
  FirebaseFirestoreServes firebaseFirestoreServes;
  ApiServes apiServes;
  SaveRepoImpl(this.apiServes, this.firebaseFirestoreServes);

  @override
  Future<Either<Failure, void>> saveMovie(
      {required String id, required String userEmail}) async {
    try {
      var dataMovei = await apiServes.gitSingle(id: id);
      dataMovei['userEmail'] = userEmail;
      return right(await firebaseFirestoreServes.post(
          collection: 'movies', body: dataMovei));
    } catch (e) {
      return left(FireBaseFailure('error in save movie'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteMovie(
      {required String id, required String userEmail}) async {
    try {
      var data = await firebaseFirestoreServes.get(
          collection: 'movies', where: userEmail);
      List<SaveModel> saveModel = [];
      for (int i = 0; i < data.length; i++) {
        saveModel.add(SaveModel.fromJsonData(data[i]));
      }
      var movie = saveModel.where((row) => (row.movieId == id));
      String docId = movie.first.docId;

      return right(await firebaseFirestoreServes.delete(
          collection: 'movies', docId: docId));
    } catch (e) {
      return left(FireBaseFailure('error in delete'));
    }
  }

  @override
  Future<Either<Failure, List<SaveModel>>> getMovie(
      {required String userEmail}) async {
    try {
      var data = await firebaseFirestoreServes.get(
          collection: 'movies', where: userEmail);
      List<SaveModel> saveModel = [];
      for (int i = 0; i < data.length; i++) {
        saveModel.add(SaveModel.fromJsonData(data[i]));
      }
      return right(saveModel);
    } catch (e) {
      return left(FireBaseFailure('error in get movies'));
    }
  }
}
