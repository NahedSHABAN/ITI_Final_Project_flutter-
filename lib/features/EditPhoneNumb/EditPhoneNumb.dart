import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/constants/app_colors.dart';
import '../LoginFeature/ui/widgets/jumia_logo.dart';
import '../feedFeature/ui/widgets/button.dart';
import '../registration/widgets/PhoneTextField.dart';
import 'widgets/LockProfileAvatar.dart';

class EditPhoneNumb extends StatefulWidget {
  const EditPhoneNumb({Key? key}) : super(key: key);

  @override
  State<EditPhoneNumb> createState() => _EditPhoneNumbState();
}

class _EditPhoneNumbState extends State<EditPhoneNumb> {
  static const appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              LockProfileAvatar(),
              SizedBox(height: 10.h),
              Text(
                'Current phone number',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "This is the phone number currently associated with your profile. You can change it by clicking on the button below.",
                  textAlign: TextAlign.center,
                ),
              ),
              PhoneNumberTextField(
                label: 'Phone Number',
                onValueChanged: (String) {},
              ),
              SizedBox(height: 100.h),
              Button(
                width: 310.w,
                color: appColors.secondColor,
                onPressed: () {},
                title: 'Edit Phone Number',
                appColors: AppColors(),
                backgroundColor: AppColors.appBarActive,
              ),
              SizedBox(height: 100.h),
              JumiaLogo(),
            ],
          ),
        ),
      ),
    );
  }
}
