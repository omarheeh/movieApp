import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/feuters/home/presentation/view/movie_details_view.dart';
import 'package:movies_app/feuters/save/presintation/view_model/save_cubit/save_cubit.dart';

class SaveViewBody extends StatelessWidget {
  const SaveViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(child: BlocBuilder<SaveCubit, SaveState>(
            builder: (context, state) {
              if (state is SaveSucsess) {
                return GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: state.saveModel.length,
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
                                  id: state.saveModel[index].movieId,
                                )));
                      },
                      child: CachedNetworkImage(
                        imageUrl: state.saveModel[index].image,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    );
                  },
                );
              } else if (state is SaveFailure) {
                return Center(
                  child: Text(state.errMessage),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
        ],
      ),
    );
  }
}
