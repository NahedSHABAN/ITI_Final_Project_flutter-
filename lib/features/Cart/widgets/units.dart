import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/constants/app_colors.dart';

class Units extends StatelessWidget {
  const Units({
    super.key,
    required this.appColors,
    required this.units,
  });

  final AppColors appColors;
  final String units;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/Icons/exclamation-mark.png',
          height: 10.h,
          width: 10.w,
        ),
        2.horizontalSpace,
        Text(
          units,
          style: TextStyle(
              color: appColors.flashSale,
              fontSize: 10.sp
          ),
        ),
        2.horizontalSpace,
        Text(
          'units left',
          style: TextStyle(
              color: appColors.flashSale,
              fontSize: 10.sp
          ),
        )
      ],
    );
  }
}
