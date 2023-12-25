import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movies_app/core/utils/methods.dart';
import 'package:movies_app/core/utils/size_config.dart';
import 'package:movies_app/feuters/home/data/model/movie_detail/movie_detail.dart';

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({
    super.key,
    required this.movieDetail,
  });
  final MovieDetail movieDetail;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Methods.ButtomsColors(),
      ),
      width: SizeConfig.screenWidth,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                IconlyLight.arrowLeft2,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                      text: movieDetail.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  TextSpan(
                      text: '(${movieDetail.year})',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                      )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  '${movieDetail.country}',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  '${movieDetail.runtime}',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
