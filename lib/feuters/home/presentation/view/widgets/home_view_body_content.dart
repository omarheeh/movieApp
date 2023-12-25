import 'package:flutter/material.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/news_list_view.dart';
import 'package:movies_app/feuters/home/presentation/view/widgets/news_title.dart';

class HomeViewBodyContent extends StatelessWidget {
  const HomeViewBodyContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TitelWidget(
              title: 'News',
            ),
          ),
          SizedBox(height: 15),
          NewsListView(),
        ],
      ),
    );
  }
}
