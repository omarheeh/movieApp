import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/feuters/home/data/model/movie_model.dart';

class NewsListViewItem extends StatelessWidget {
  const NewsListViewItem({
    super.key,
    required this.movieModel,
  });
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      width: 100,
      height: 150,
      child: CachedNetworkImage(
        imageUrl: movieModel.poster == 'N/A'
            ? 'https://i.postimg.cc/XJNxJ0bC/360-F-473254957-bx-G9yf4ly7-OBO5-I0-O5-KABl-N930-Gwa-MQz.jpg'
            : movieModel.poster!,
        fit: BoxFit.cover,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
