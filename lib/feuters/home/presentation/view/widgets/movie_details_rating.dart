import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/constents/app_colors.dart';
import 'package:movies_app/feuters/home/data/model/movie_detail/rating.dart';

class MovieDetailsRating extends StatelessWidget {
  const MovieDetailsRating({
    super.key,
    this.ratings,
  });
  final List<Rating>? ratings;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          ratings!.length,
          (index) => Expanded(
            child: Column(
              children: [
                AutoSizeText(
                  ratings![index].value!,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.darkPrimary,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  ratings![index].source!,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
