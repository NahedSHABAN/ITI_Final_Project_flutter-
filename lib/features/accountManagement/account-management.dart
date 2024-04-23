import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/features/LoginFeature/ui/widgets/jumia_logo.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'widgets/Dropdown-list.dart';

class AccountManage extends StatefulWidget {
  const AccountManage({Key? key}) : super(key: key);

  @override
  _AccountManageState createState() => _AccountManageState();
}

class _AccountManageState extends State<AccountManage> {
  DropListModel dropListModel1 = DropListModel([
    OptionItem(id: "1", title: "Basic Details"),
    OptionItem(id: "2", title: "Edit Phone Number"),
  ]);
  OptionItem optionItemSelected1 = OptionItem(title: "Profile Details");

  DropListModel dropListModel2 = DropListModel([
    OptionItem(id: "1", title: "Manage Passkeys"),
    OptionItem(id: "2", title: "Change Password"),
    OptionItem(id: "3", title: "Pin Settings"),
    OptionItem(id: "4", title: "Delete Account"),
  ]);
  OptionItem optionItemSelected2 = OptionItem(title: "Security Settings");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 60.h,
                        width: 60.w,
                        child: Image.asset('assets/images/Icons/unnamed.png'),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Welcome To Jumia',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.h),
                      CustomDropDown(
                        itemSelected: optionItemSelected1,
                        dropListModel: dropListModel1,
                        icon: const Icon(Icons.account_circle,
                            color: Colors.black),
                        onOptionSelected: (optionItem) {
                          setState(() {
                            optionItemSelected1 = optionItem;
                          });
                        },
                      ),
                      CustomDropDown(
                        itemSelected: optionItemSelected2,
                        dropListModel: dropListModel2,
                        icon: const Icon(Icons.lock),
                        onOptionSelected: (optionItem) {
                          setState(() {
                            optionItemSelected2 = optionItem;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              JumiaLogo(),
            ],
          ),
        ),
      ),
    );
  }
}
