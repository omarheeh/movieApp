import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/feuters/home/data/model/movie_detail/movie_detail.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/details_title.dart';

class MoviewDetailsRowData extends StatelessWidget {
  const MoviewDetailsRowData({
    super.key,
    required this.movieDetail,
  });
  final MovieDetail movieDetail;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            children: [
              DetailsTitle(
                title: 'Release data',
                value: '${movieDetail.released}',
              ),
              SizedBox(height: 20),
              DetailsTitle(
                title: 'Director',
                value: '${movieDetail.director}',
              ),
              SizedBox(height: 20),
              DetailsTitle(
                title: 'Writer',
                value: '${movieDetail.writer}',
              ),
              SizedBox(height: 20),
              DetailsTitle(
                title: 'Actors',
                value: '${movieDetail.actors}',
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex: 2,
          child: CachedNetworkImage(
            imageUrl: "${movieDetail.poster}",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ],
    );
  }
}
