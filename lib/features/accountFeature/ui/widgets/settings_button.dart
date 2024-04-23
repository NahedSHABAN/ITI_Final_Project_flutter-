import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      child: MaterialButton(
        onPressed: onPressed,
        child: Row(
          children: [
            SizedBox(width: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 12.sp,
            ),
          ],
        ),
      ),
    );
  }
}
