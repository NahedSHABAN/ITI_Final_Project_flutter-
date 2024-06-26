import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumia/features/Cart/Cart.dart';
import 'package:jumia/features/accountFeature/ui/account.dart';
import 'package:jumia/features/helpFeature/ui/help.dart';
import 'package:jumia/features/homeFeature/ui/home_screen.dart';
import 'package:jumia/features/categoriesFeature/ui/categoreies.dart';
import 'package:jumia/features/feedFeature/ui/feed.dart';
import '../../utils/constants/app_colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final appColors = const AppColors();
  final List<Widget> screens = [
    const HomeScreen(),
    const Categories(),
    const Feed(),
    const Account(),
    const Help(),
     Cart()

  ];
  final List<String> titles = ['', '', 'Feed', 'Account', 'Help','Cart'];

  @override
  Widget build(BuildContext context) {
    bool showSearch = _currentIndex <= 1;
    bool showIcon = _currentIndex <= 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        actions: showIcon
            ? [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>Cart()));
              },
              child: Icon(Icons.shopping_cart_outlined,
                  color: appColors.secondColor),
            ),
          ),
        ]
            : [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: Row(
              children: [
                Icon(Icons.search_sharp,
                    color: appColors.secondColor),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>Cart()));
                  },
                  child: Icon(Icons.shopping_cart_outlined,
                      color: appColors.secondColor),
                ),
              ],
            ),
          ),
        ],
        title: showSearch
            ? Container(
          decoration: BoxDecoration(
            color: appColors.secondColor,
            borderRadius: const BorderRadius.all(Radius.circular(7)),
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  Icons.search_sharp,
                  color: Colors.black,

                ),
              ),
              Expanded(
                child: TextFormField(
                  cursorColor: AppColors.appBarActive,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search on Jumia'.tr(),
                  ),
                ),
              ),
            ],
          ),
        )
            : Text(
          titles[_currentIndex],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: appColors.secondColor,
          ),
        ),
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.appBarActive,
        unselectedItemColor: appColors.black,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list_alt),
            label: 'Categories'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.photo_filter_outlined),
            label: 'Feed'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: 'Account'.tr(),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.help_outline),
            label: 'Help'.tr(),
          ),
        ],
        selectedIconTheme: IconThemeData(color: AppColors.appBarActive),
        unselectedIconTheme: IconThemeData(color: appColors.black),
      ),
    );
  }
}
