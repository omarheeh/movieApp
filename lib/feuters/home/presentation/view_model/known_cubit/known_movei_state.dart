part of 'known_movei_cubit.dart';

@immutable
sealed class KnownMoveiState {}

final class KnownMoveiInitial extends KnownMoveiState {}

final class KnownMoveiLoading extends KnownMoveiState {}

final class KnownMoveiSucsess extends KnownMoveiState {
  final List<MovieModel> movies;
  KnownMoveiSucsess(this.movies);
}

final class KnownMoveiFailure extends KnownMoveiState {
  final String errMessage;
  KnownMoveiFailure(this.errMessage);
}
