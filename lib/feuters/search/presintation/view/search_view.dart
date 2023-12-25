import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/serves/api_serves.dart';
import 'package:movies_app/feuters/search/data/search_repo/search_repo_impl.dart';
import 'package:movies_app/feuters/search/presintation/view/widgets/search_view_body.dart';
import 'package:movies_app/feuters/search/presintation/view_model/cubit/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchCubit(SearchRepoImpl(ApiServes(Dio()))),
        child: SearchViewBody(),
      ),
    );
  }
}
