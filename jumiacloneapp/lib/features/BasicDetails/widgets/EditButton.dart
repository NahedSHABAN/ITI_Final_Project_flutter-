import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/constants/app_colors.dart'; // Make sure to import ScreenUtil if you're using it

class EditButton extends StatefulWidget {
  final VoidCallback onPressed;

  const EditButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  static const appColors = AppColors();
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 30.h,
      onPressed: widget.onPressed,
      color: appColors.saleColor,
      child: Text(
        'Edit Profile',
        style: TextStyle(
          color: AppColors.appBarActive,
          fontSize: 15.0,
        ),
      ),
    );
  }
}
