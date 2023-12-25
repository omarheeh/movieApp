import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/utils/methods.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    super.key,
    required this.icon,
    this.onTap,
  });
  final String icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 45,
        height: 45,
        decoration: ShapeDecoration(
          gradient: Methods.ButtomsColors(),
          shape: const CircleBorder(),
        ),
        child: Align(
          child: SvgPicture.asset(
            'assets/svg/$icon',
            width: 25,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}
