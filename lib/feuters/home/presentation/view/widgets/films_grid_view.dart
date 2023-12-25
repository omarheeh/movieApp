import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feuters/home/data/model/movie_model.dart';
import 'package:movies_app/feuters/home/presentation/view/movie_details_view.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/films_grid_view_item.dart';
import 'package:movies_app/feuters/home/presentation/view_model/grid_movei/grid_movei_cubit.dart';

class FilmesGridView extends StatelessWidget {
  const FilmesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GridMoveiCubit, GridMoveiState>(
      builder: (context, state) {
        List<MovieModel> movies =
            BlocProvider.of<GridMoveiCubit>(context).movies;
        if (state is GridMoveiSucsess) {
          return SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetailsView(
                                id: movies[index].imdbId!,
                              )));
                    },
                    child: FilmsGridViewItem(
                      movie: movies[index],
                    ),
                  );
                },
                childCount: movies.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.75,
              ),
            ),
          );
        } else if (state is GridMoveiFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errMessage),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
