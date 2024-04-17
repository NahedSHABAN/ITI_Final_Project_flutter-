import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/features/Cart/widgets/units.dart';

import '../../../core/utils/constants/app_colors.dart';

class CartItemDetails extends StatelessWidget {
  const CartItemDetails({
    super.key,
    required this.appColors,
    required this.title,
    required this.price,
    required this.units,
  });

  final AppColors appColors;
  final String title;
  final String price;
  final String units;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width *0.5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 13.sp,
              ),
              overflow: TextOverflow.visible,
            ),
          ),
          5.verticalSpace,
          Text(
            'EGP' + " " + price,
            style: TextStyle(
                fontSize: 17.sp,
                overflow: TextOverflow.visible,
                fontWeight: FontWeight.bold),
          ),
          5.verticalSpace,
          Units(
            appColors: appColors,
            units: units,
          )
        ],
      ),
    );
  }
}
