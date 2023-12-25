import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feuters/home/presentation/view/movie_details_view.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/news_list_view_item.dart';
import 'package:movies_app/feuters/home/presentation/view_model/home_cubit/home_cubit.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeNewsSucsess) {
          return SizedBox(
            height: 150,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MovieDetailsView(
                              id: state.movies[index].imdbId!,
                            )));
                  },
                  child: NewsListViewItem(
                    movieModel: state.movies[index],
                  ),
                );
              },
              itemCount: state.movies.length,
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
