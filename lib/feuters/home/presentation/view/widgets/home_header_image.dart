import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/size_config.dart';
import 'package:movies_app/cubit/theme/theme_cubit.dart';

class HomeHeaderImage extends StatelessWidget {
  const HomeHeaderImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: SizeConfig.defaultSize * 50,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/moveimage.jpeg',
            width: SizeConfig.screenWidth,
            height: SizeConfig.screenHeight,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -5,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: BlocProvider.of<ThemeCubit>(context).GetIsDarkTheme
                      ? [
                          Colors.black.withOpacity(0.0),
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.3),
                          Colors.black.withOpacity(0.4),
                          Colors.black.withOpacity(0.5),
                          Colors.black.withOpacity(0.6),
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.9),
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                        ]
                      : [
                          Colors.white.withOpacity(0.0),
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.2),
                          Colors.white.withOpacity(0.3),
                          Colors.white.withOpacity(0.4),
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.6),
                          Colors.white.withOpacity(0.7),
                          Colors.white.withOpacity(0.9),
                          Colors.white,
                          Colors.white,
                          Colors.white,
                          Colors.white,
                        ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
