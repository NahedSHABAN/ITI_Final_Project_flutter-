import 'package:flutter/cupertino.dart';

import '../../../../core/utils/constants/app_colors.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.appColors,
    required this.title,
  });

  final AppColors appColors;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: appColors.secondColor,
      ),
    );
  }
}
