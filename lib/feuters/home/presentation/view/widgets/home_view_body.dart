import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/films_grid_view.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/home_view_header.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/news_title.dart';
import 'package:movies_app/feuters/home/presentation/view_model/grid_movei/grid_movei_cubit.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: const [
        HomeViewHeader(),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TitelWidget(
              title: 'Films',
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        FilmesGridView(),
        SliverToBoxAdapter(
          child: SizedBox(height: 50),
        ),
      ],
    );
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      BlocProvider.of<GridMoveiCubit>(context).getMoviesOnScroll();
    }
  }
}
