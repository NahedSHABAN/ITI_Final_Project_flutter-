import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LockProfileAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 60.w,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Image.asset('assets/images/Icons/unnamed.png'),
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 14.0,
            child: Icon(
              Icons.lock,
              color: Colors.white,
              size: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
