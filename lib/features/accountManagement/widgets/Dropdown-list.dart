import 'package:flutter/material.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:jumia/core/utils/constants/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart'; 
import '../../BasicDetails/BasicDetails.dart';
import '../../EditPhoneNumb/EditPhoneNumb.dart';
import '../../LoginFeature/ui/login_screen.dart';
import '../../registration/user-repo/user-repo.dart';

class CustomDropDown extends StatelessWidget {
  final DropListModel dropListModel;
  final Icon icon;
  final OptionItem itemSelected;
  final ValueChanged<OptionItem> onOptionSelected;
  static const appColors = AppColors();

  // Register UserRepo here
  CustomDropDown({
    Key? key,
    required this.dropListModel,
    required this.icon,
    required this.itemSelected,
    required this.onOptionSelected,
  }) : super(key: key) {
    Get.put(UserRepo());
  }

  @override
  Widget build(BuildContext context) {
    return SelectDropList(
      itemSelected: itemSelected,
      dropListModel: dropListModel,
      showIcon: true,
      showArrowIcon: true,
      arrowColor: appColors.flashSale,
      showBorder: false,
      paddingTop: 0,
      icon: icon,
      onOptionSelected: (option) {
        // Use if condition to navigate based on option title
        if (option.title == "Basic Details") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BasicDetails()),
          );
        } else if (option.title == "Edit Phone Number") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditPhoneNumb()),
          );
        } else if (option.title == "Delete Account") {
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            print(user.uid);
            UserRepo.instance.deleteUser(user.uid);
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Login()),
            );
          }
        }
      },
    );
  }
}
