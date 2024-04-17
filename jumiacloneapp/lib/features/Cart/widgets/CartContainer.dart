// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/constants/app_colors.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({Key? key}) : super(key: key);
  static const appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Theme.of(context).backgroundColor,
              child: Container(
                color: appColors.primaryColor,
                child: Image.asset('assets/images/Icons/cart.png'),
              ),
            ),
          8.verticalSpace,
            Text(
              'Your cart is empty!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.sp,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Browse our categories and discover our best deals!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
