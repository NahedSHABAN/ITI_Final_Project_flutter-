import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 60.h,
        width: 60.w,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Image.asset('assets/images/Icons/unnamed.png'),
            Icon(
              Icons.account_circle,
              color: Colors.black,
              size: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
