part of 'save_cubit.dart';

@immutable
sealed class SaveState {}

final class SaveInitial extends SaveState {}

final class SaveLoading extends SaveState {}

final class SaveSucsess extends SaveState {
  final List<SaveModel> saveModel;
  SaveSucsess(this.saveModel);
}

final class SaveFailure extends SaveState {
  final String errMessage;
  SaveFailure(this.errMessage);
}
