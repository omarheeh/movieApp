import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/git_it.dart';
import 'package:movies_app/feuters/home/data/home_repo/home_repo_impl.dart';
import 'package:movies_app/feuters/home/presentation/view/movie_details_view.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/news_list_view_item.dart';
import 'package:movies_app/feuters/home/presentation/view_model/known_cubit/known_movei_cubit.dart';

class KnownListView extends StatelessWidget {
  const KnownListView({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          KnownMoveiCubit(getIt.get<HomeRepoImpl>())..getKnown(title: title),
      child: SizedBox(
        height: 150,
        child: BlocBuilder<KnownMoveiCubit, KnownMoveiState>(
          builder: (context, state) {
            if (state is KnownMoveiSucsess) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.movies.length,
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
              );
            } else if (state is KnownMoveiFailure) {
              return Center(
                child: Text(state.errMessage),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
