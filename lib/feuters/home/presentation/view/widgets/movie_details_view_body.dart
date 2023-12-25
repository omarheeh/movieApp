import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/known_list_view.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/movieDetailsHeader.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/movie_details_view_loading.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/movie_details_rating.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/movie_details_row_data.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/news_title.dart';
import 'package:movies_app/feuters/home/presentation/view_model/movie_details_view/movie_details_cubit.dart';

class MoviewDetailsViewBody extends StatelessWidget {
  const MoviewDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsSucsess) {
            return Column(
              children: [
                Column(
                  children: [
                    MovieDetailsHeader(
                      movieDetail: state.movieDetial,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          MovieDetailsRating(
                            ratings: state.movieDetial.ratings,
                          ),
                          const SizedBox(height: 30),
                          MoviewDetailsRowData(
                            movieDetail: state.movieDetial,
                          ),
                          const SizedBox(height: 30),
                          const TitelWidget(
                            title: 'StoryLine',
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "${state.movieDetial.plot}",
                          ),
                          const SizedBox(height: 30),
                          const TitelWidget(
                            title: 'Known for',
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    KnownListView(
                      title: state.movieDetial.title!,
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ],
            );
          } else {
            return const MovieDetailsViewLoading();
          }
        },
      ),
    );
  }
}
