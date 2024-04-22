import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../accountManagement/account-management.dart';
import 'settings_button.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer({
    Key? key,
    required this.appColors,
  }) : super(key: key);

  final AppColors appColors;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      SettingsButton(
        title: 'Address book',
        onPressed: () {},
      ),
    ];

    if (FirebaseAuth.instance.currentUser != null) {
      children.add(_buildAccountManagementButton(context));
      children.add(
        SettingsButton(
          title: 'Close Account',
          onPressed: () {},
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: appColors.secondColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          children: children,
        ),
      ),
    );
  }

  Widget _buildAccountManagementButton(BuildContext context) {
    return SettingsButton(
      title: 'Account Management',
      onPressed: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const AccountManage()));
      },
    );
  }
}
