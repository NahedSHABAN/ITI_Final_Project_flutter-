import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/core/router/layout/bottom_nav_bar.dart';
import 'package:jumia/features/feedFeature/ui/widgets/button.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../Cart/Cart.dart';
import '../../../accountFeature/ui/widgets/account_text.dart';
import '../../../productDetailsFeature/ui/widgets/app_bar_leading.dart';
import '../../../productDetailsFeature/ui/widgets/app_bar_title.dart';

class ConfirmOrder extends StatefulWidget {
  const ConfirmOrder({super.key});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  final AppColors appColors = const AppColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: const AppBarTitle(
          appColors: Cart.appColors,
          title: 'Check Out',
        ),
        leading: const AppBarLeading(appColors: Cart.appColors),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/Icons/kisspng-computer-icons-check-mark-vector-graphics-clip-art-5b698b6aeeb295.4206379415336436269777.png',
                        height: 200.h,
                      ),
                      Text(
                        'Thank you for placing an order on Jumia',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
                5.verticalSpace,
                5.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Order Number : ',
                      style: TextStyle(color: AppColors.grey),
                    ),
                    Text(
                      '54458447857',
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                5.verticalSpace,
                AccountText(
                  title: 'Next Steps',
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: appColors.secondColor,
                      borderRadius: BorderRadius.circular(7)),
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 5.h),
                          child: Text(
                              'Congratulations! Your order was successfully submitted, you will receive a confirmation email or SMS, our customer service might contact you shortly to verify your order',
                            style: TextStyle(color: AppColors.grey.shade600),
                            textAlign: TextAlign.center,
                          )),
                    ],
                  ),
                ),
                15.verticalSpace,
                Button(
                  appColors: appColors,
                  title: 'Continue Shopping',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BottomNavBar()));
                  },
                  width: double.infinity,
                  color: appColors.secondColor,
                  backgroundColor: AppColors.appBarActive,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
