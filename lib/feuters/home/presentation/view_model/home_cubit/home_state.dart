part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeNewsLoading extends HomeState {}

final class HomeNewsSucsess extends HomeState {
  final List<MovieModel> movies;
  HomeNewsSucsess(this.movies);
}

final class HomeNewsFailure extends HomeState {
  final String errMessage;
  HomeNewsFailure(this.errMessage);
}
