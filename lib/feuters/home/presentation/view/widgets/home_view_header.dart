import 'package:flutter/material.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/categores_list_title.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/home_header_image.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/home_view_body_content.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/stars_widget.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const HomeHeaderImage(),
          const SizedBox(height: 10),
          const Text(
            '4.0',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 33,
            ),
          ),
          const SizedBox(height: 10),
          const StarsWidget(),
          const SizedBox(height: 10),
          const CategoresListTitle(),
          const SizedBox(height: 20),
          const HomeViewBodyContent(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
