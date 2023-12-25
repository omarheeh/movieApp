part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}

final class MovieDetailsInitial extends MovieDetailsState {}

final class MovieDetailsSucsess extends MovieDetailsState {
  final MovieDetail movieDetial;
  MovieDetailsSucsess(this.movieDetial);
}

final class MovieDetailsFailure extends MovieDetailsState {
  final String errMessage;
  MovieDetailsFailure(this.errMessage);
}

final class MovieDetailsLoading extends MovieDetailsState {}
