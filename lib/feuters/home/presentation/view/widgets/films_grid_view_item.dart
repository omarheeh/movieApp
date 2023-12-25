import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/feuters/home/data/model/movie_model.dart';

class FilmsGridViewItem extends StatelessWidget {
  const FilmsGridViewItem({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CachedNetworkImage(
        imageUrl: movie.poster! == 'N/A'
            ? 'https://i.postimg.cc/XJNxJ0bC/360-F-473254957-bx-G9yf4ly7-OBO5-I0-O5-KABl-N930-Gwa-MQz.jpg'
            : movie.poster!,
        fit: BoxFit.fill,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
