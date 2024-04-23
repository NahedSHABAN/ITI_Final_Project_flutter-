import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication
import 'package:jumia/core/utils/constants/app_colors.dart';
import 'package:jumia/features/accountFeature/ui/widgets/account_app_bar.dart';
import 'package:jumia/features/accountFeature/ui/widgets/account_container.dart';
import 'package:jumia/features/accountFeature/ui/widgets/account_text.dart';
import 'package:jumia/features/accountFeature/ui/widgets/balance_bannar.dart';
import 'package:jumia/features/accountFeature/ui/widgets/settings_container.dart';
import '../../LoginFeature/ui/login_screen.dart';
import '../../feedFeature/ui/widgets/button.dart';

class Account extends StatefulWidget {
  const Account({Key? key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // Firebase Authentication instance

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors();

    return Scaffold(
      backgroundColor: appColors.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.appBarColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  5.verticalSpace,
                  const AccountAppBar(appColors: AppColors()),
                  10.verticalSpace
                ],
              ),
            ),
          ),
          BalanceBanner(
            appColors: AppColors(),
            onTap: () {},
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.verticalSpace,
                      const AccountText(
                        title: 'MY JUMIA ACCOUNT',
                      ),
                      const AccountContainer(appColors: AppColors()),
                      const AccountText(
                        title: 'MY SETTINGS',
                      ),
                      const SettingsContainer(appColors: AppColors()),
                    ],
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: FutureBuilder<User?>(
                    future: _auth
                        .authStateChanges()
                        .first, // Fetches the current user
                    builder:
                        (BuildContext context, AsyncSnapshot<User?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator(); // Show loading indicator while checking authentication state
                      } else {
                        final bool isLoggedIn =
                            snapshot.hasData && snapshot.data != null;
                        return Button(
                          appColors: appColors,
                          onPressed: isLoggedIn
                              ? () async {
                                  await _auth
                                      .signOut(); // If user is logged in, sign out
                                  // Navigate back to the root (Account screen) to refresh the project
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                }
                              : () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );
                                },
                          title: isLoggedIn
                              ? 'LOGOUT'
                              : 'LOGIN', // Change button text based on authentication state
                          width: 330.w,
                          backgroundColor: appColors.primaryColor,
                          color: AppColors.appBarActive,
                        );
                      }
                    },
                  ),
                ),
                10.verticalSpace,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
