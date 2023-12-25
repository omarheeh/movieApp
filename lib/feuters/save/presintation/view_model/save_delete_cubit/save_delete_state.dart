part of 'save_delete_cubit.dart';

@immutable
sealed class SaveDeleteState {}

final class SaveDeleteInitial extends SaveDeleteState {}

final class SaveButtonLoading extends SaveDeleteState {}

final class SaveButtonSaved extends SaveDeleteState {}

final class SaveButtonNotSaved extends SaveDeleteState {}
