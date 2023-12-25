part of 'grid_movei_cubit.dart';

@immutable
sealed class GridMoveiState {}

final class GridMoveiInitial extends GridMoveiState {}

final class GridMoveiLading extends GridMoveiState {}

final class GridMoveiSucsess extends GridMoveiState {}

final class GridMoveiFailure extends GridMoveiState {
  final String errMessage;
  GridMoveiFailure(this.errMessage);
}
