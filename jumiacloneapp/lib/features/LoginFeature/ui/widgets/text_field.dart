import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/utils/constants/app_colors.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField(
      {super.key, required this.label, required this.onValueChanged});

  final String label;
  final void Function(String) onValueChanged;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  late String email; // Initialize email with an empty string

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            email = value; // Assign the value of the text field to email
            widget.onValueChanged(
                value); // Notify the parent widget about the value change
          });
        },
        cursorColor: AppColors.appBarActive,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          focusColor: AppColors.appBarActive,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.appBarActive),
          ),
          labelText: widget.label,
          floatingLabelStyle: TextStyle(color: AppColors.appBarActive),
          labelStyle: TextStyle(fontSize: 15.sp),
        ),
      ),
    );
  }
}
