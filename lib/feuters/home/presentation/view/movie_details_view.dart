import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movies_app/core/constents/app_colors.dart';
import 'package:movies_app/core/serves/api_serves.dart';
import 'package:movies_app/core/serves/firebase_firestore_serves.dart';
import 'package:movies_app/core/utils/git_it.dart';
import 'package:movies_app/feuters/auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import 'package:movies_app/feuters/home/data/home_repo/home_repo_impl.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/movie_details_view_body.dart';
import 'package:movies_app/feuters/home/presentation/view_model/movie_details_view/movie_details_cubit.dart';
import 'package:movies_app/feuters/save/data/save_ropo/save_repo_impl.dart';
import 'package:movies_app/feuters/save/presintation/view_model/save_cubit/save_cubit.dart';
import 'package:movies_app/feuters/save/presintation/view_model/save_delete_cubit/save_delete_cubit.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({
    super.key,
    required this.id,
  });
  final String id;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocProvider(
        create: (context) =>
            MovieDetailsCubit(getIt.get<HomeRepoImpl>())..getSingle(id: id),
        child: Scaffold(
          body: const MoviewDetailsViewBody(),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {},
            child: Builder(builder: (context) {
              return BlocProvider(
                create: (context) => SaveDeleteCubit(SaveRepoImpl(
                    getIt.get<ApiServes>(),
                    FirebaseFirestoreServes(FirebaseFirestore.instance))),
                child: SaveButton(
                  id: id,
                ),
              );
            }),
          ),
        ),
      );
    });
  }
}

class SaveButton extends StatefulWidget {
  const SaveButton({
    super.key,
    required this.id,
  });
  final String id;

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  void initState() {
    super.initState();
    String userEmail = BlocProvider.of<AuthCubit>(context).userModel!.email;
    BlocProvider.of<SaveDeleteCubit>(context).isSaved(widget.id, userEmail);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveDeleteCubit, SaveDeleteState>(
      builder: (context, state) {
        if (state is SaveButtonSaved) {
          return IconButton(
              onPressed: () async {
                String userEmail =
                    BlocProvider.of<AuthCubit>(context).userModel!.email;
                await BlocProvider.of<SaveCubit>(context)
                    .deleteMovies(widget.id, userEmail);
                await BlocProvider.of<SaveDeleteCubit>(context)
                    .isSaved(widget.id, userEmail);

                await BlocProvider.of<SaveCubit>(context).getMovies(userEmail);
              },
              icon: const Icon(IconlyLight.delete));
          ;
        } else if (state is SaveButtonNotSaved) {
          return IconButton(
              onPressed: () async {
                String userEmail =
                    BlocProvider.of<AuthCubit>(context).userModel!.email;
                await BlocProvider.of<SaveCubit>(context)
                    .saveMovies(widget.id, userEmail);
                await BlocProvider.of<SaveDeleteCubit>(context)
                    .isSaved(widget.id, userEmail);
              },
              icon: const Icon(IconlyLight.bookmark));
        } else {
          return const CircularProgressIndicator(
            color: AppColors.darkPrimary,
          );
        }
      },
    );
  }
}
