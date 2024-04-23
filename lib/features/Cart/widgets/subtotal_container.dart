import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/constants/app_colors.dart';

class SubtotalContainer extends StatelessWidget {
  const SubtotalContainer({
    super.key,
    required this.appColors, required this.price,
  });

  final AppColors appColors;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding:EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 10.w
          ),
          child: Row(
            children: [
              Text(
                'Subtotal',
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold
                ),
              ),
              Spacer(),
              Text(
                'EGP'+" "+price,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold
                ),
              ),

            ],
          ),
        ),
        width: double.infinity,
        // height: 40.h,
        color: appColors.secondColor
    );
  }
}
