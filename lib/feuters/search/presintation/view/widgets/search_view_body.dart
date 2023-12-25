import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movies_app/core/utils/size_config.dart';
import 'package:movies_app/feuters/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:movies_app/feuters/home/data/model/movie_model.dart';
import 'package:movies_app/feuters/search/presintation/view/widgets/search_grid_view.dart';
import 'package:movies_app/feuters/search/presintation/view_model/cubit/search_cubit.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  TextEditingController searchControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: SizeConfig.defaultSize * 5),
          CustomTextField(
            prefixIcon: Icon(IconlyLight.search),
            controller: searchControler,
            onFieldSubmitted: (value) {
              BlocProvider.of<SearchCubit>(context)
                  .searchOnSubit(search: value);
            },
          ),
          const SizedBox(height: 20),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchInitial) {
                return const SizedBox();
              }
              if (state is SearchSucsess) {
                List<MovieModel> movies =
                    BlocProvider.of<SearchCubit>(context).movies;
                return Expanded(
                  child: SearchGridView(
                    search: searchControler.text,
                    movies: movies,
                  ),
                );
              } else if (state is SearchFailure) {
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
        ],
      ),
    );
  }
}
