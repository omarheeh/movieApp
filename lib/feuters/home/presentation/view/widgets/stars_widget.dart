import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class StarsWidget extends StatelessWidget {
  const StarsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          IconlyBold.star,
          size: 20,
          color: Color(0xffffa90a),
        ),
        Icon(
          IconlyBold.star,
          size: 20,
          color: Color(0xffffa90a),
        ),
        Icon(
          IconlyLight.star,
          size: 20,
          color: Color(0xffffa90a),
        ),
        Icon(
          IconlyLight.star,
          size: 20,
          color: Color(0xffffa90a),
        ),
        Icon(
          IconlyLight.star,
          size: 20,
          color: Color(0xffffa90a),
        ),
      ],
    );
  }
}
