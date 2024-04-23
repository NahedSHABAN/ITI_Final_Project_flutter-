import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/constants/app_colors.dart';

class LinkText2 extends StatelessWidget {
  const LinkText2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add your onTap functionality here
      },
      child: Text(
        'Forgot your password?',
        style: TextStyle(
          color: AppColors.appBarActive,
          decorationColor: AppColors.appBarActive,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
