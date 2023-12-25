import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movies_app/core/constents/app_colors.dart';
import 'package:movies_app/cubit/theme/theme_cubit.dart';
import 'package:movies_app/feuters/home/presentation/view/home_view.dart';
import 'package:movies_app/feuters/auth/presentation/view/profile_view.dart';
import 'package:movies_app/feuters/save/presintation/view/save_view.dart';
import 'package:movies_app/feuters/search/presintation/view/search_view.dart';

class PageNavigator extends StatefulWidget {
  const PageNavigator({super.key});
  static const String id = 'pageNavigator';
  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  late PageController scrollController;
  int currentView = 0;
  List<Widget> views = [
    const HomeView(),
    const SearchView(),
    const SaveView(),
    const ProfileView(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      scrollController.jumpToPage(_selectedIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: scrollController,
        children: [...views],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: BlocProvider.of<ThemeCubit>(context).GetIsDarkTheme
              ? []
              : [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    blurRadius: 10,
                  ),
                ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.darkPrimary,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          unselectedFontSize: 8,
          selectedFontSize: 8,
          iconSize: 22,
          type: BottomNavigationBarType.fixed,
          elevation: 100,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              // Define the icon for the first tab
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(IconlyLight.home),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(IconlyBold.home),
              ),
              // Define the label for the first tab
              label: 'HOME',
              // Define the color of the label when selected and unselected
              // based on the selected index
            ),
            BottomNavigationBarItem(
              // Define the icon for the second tab
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(IconlyLight.search),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(IconlyBold.search),
              ),
              // Define the label for the second tab
              label: 'SEARCH',
              // Define the color of the label when selected and unselected
              // based on the selected index
            ),
            BottomNavigationBarItem(
              // Define the icon for the third tab
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(IconlyLight.bookmark),
              ),
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(IconlyBold.bookmark),
              ),
              // Define the label for the third tab
              label: 'SAVE',
            ),
            BottomNavigationBarItem(
              // Define the icon for the third tab
              icon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(IconlyLight.profile),
              ),
              // Define the label for the third tab
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: Icon(IconlyBold.profile),
              ),
              label: 'PROFILE',
            ),
          ],
        ),
      ),
    );
  }
}
