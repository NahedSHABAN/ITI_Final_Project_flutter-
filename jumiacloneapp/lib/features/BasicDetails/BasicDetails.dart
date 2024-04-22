import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jumia/features/LoginFeature/ui/login_screen.dart';
import 'package:jumia/features/LoginFeature/ui/widgets/jumia_logo.dart';
import '../registration/user-model.dart';
import '../registration/user-repo/user-repo.dart';
import '../splashFeatures/ui/splash_screen.dart';
import 'widgets/CustomTextFormField.dart';
import 'widgets/EditButton.dart';
import 'widgets/ProfileAvatar.dart';

class BasicDetails extends StatefulWidget {
  const BasicDetails({Key? key}) : super(key: key);

  @override
  State<BasicDetails> createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  final _userRepo = Get.put(UserRepo());
  final User = UserRepo();

  String? userEmail;
  UserModel? userdata;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _getCurrentUser();
  }

  Future<void> _getCurrentUser() async {
    setState(() {
      isLoading = true;
    });
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        userEmail = user.email;
        print(user.uid);
      });
      // Fetch userdata
      List<UserModel> users = await _userRepo.getUserDetails(userEmail!);
      print(users);
      if (users.isNotEmpty) {
        setState(() {
          print("done");
          userdata = users[0];
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: SplashScreen(),
            )
          : userEmail != null
              ? _buildUserProfile()
              : _buildLoginButton(),
    );
  }

  Widget _buildUserProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ProfileAvatar(),
                  20.verticalSpace,
                  Text(
                    'Profile Details',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  20.verticalSpace,
                  CustomTextFormField(
                    labelText: 'First Name',
                    initialValue: userdata!.firstName,
                    onChanged: (value) {
                      setState(() {
                        userdata!.setFirstName(value);
                      });
                    },
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    labelText: 'Last Name',
                    initialValue: userdata!.lastName,
                    onChanged: (value) {
                      setState(() {
                        userdata!.setLastName(value);
                      });
                    },
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    labelText: 'Email',
                    initialValue: userdata!.email,
                    onChanged: (value) {
                      setState(() {
                        userdata!.setEmail(value);
                      });
                    },
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    labelText: 'Gender',
                    initialValue: userdata!.gender,
                    onChanged: (value) {
                      setState(() {
                        userdata!.setGender(value);
                      });
                    },
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    labelText: 'Birth Date',
                    initialValue: userdata!.birthDate,
                    onChanged: (value) {
                      setState(() {
                        userdata!.setBirthDate(value);
                      });
                    },
                  ),
                  10.verticalSpace,
                  CustomTextFormField(
                    labelText: 'Phone Number',
                    initialValue: userdata!.phoneNumber,
                    onChanged: (value) {
                      setState(() {
                        userdata!.setPhoneNumber(value);
                      });
                    },
                  ),
                  20.verticalSpace,
                  EditButton(
                    onPressed: () {
                      final user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        final userModel = UserModel(
                          email: userdata!.email,
                          firstName: userdata!.firstName,
                          lastName: userdata!.lastName,
                          phoneNumber: userdata!.phoneNumber,
                          birthDate: userdata!.birthDate,
                          gender: userdata!.gender,
                          userID: user.uid,
                        );
                        // Save the user details to your database
                        User.UpdateUser(userModel);
                        // Navigate to the home screen or any other screen
                        Navigator.of(context).pop();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        JumiaLogo(),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Login();
  }
}
