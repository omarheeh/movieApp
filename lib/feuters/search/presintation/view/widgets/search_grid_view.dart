import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feuters/home/data/model/movie_model.dart';
import 'package:movies_app/feuters/home/presentation/view/movie_details_view.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/films_grid_view_item.dart';
import 'package:movies_app/feuters/search/presintation/view_model/cubit/search_cubit.dart';

class SearchGridView extends StatefulWidget {
  const SearchGridView({
    super.key,
    required this.movies,
    required this.search,
  });

  final List<MovieModel> movies;
  final String search;

  @override
  State<SearchGridView> createState() => _SearchGridViewState();
}

class _SearchGridViewState extends State<SearchGridView> {
  late ScrollController scrollController;

  get movies => null;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      physics: BouncingScrollPhysics(),
      itemCount: widget.movies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MovieDetailsView(
                      id: widget.movies[index].imdbId!,
                    )));
          },
          child: FilmsGridViewItem(movie: widget.movies[index]),
        );
      },
    );
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      BlocProvider.of<SearchCubit>(context)
          .searchOnScroll(search: widget.search);
    }
  }
}
