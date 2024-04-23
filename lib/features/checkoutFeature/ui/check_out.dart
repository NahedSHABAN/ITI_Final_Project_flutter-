import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/features/checkoutFeature/ui/widgets/confirm_order.dart';
import 'package:jumia/features/feedFeature/ui/widgets/button.dart';

import '../../../core/utils/constants/app_colors.dart';
import '../../Cart/Cart.dart';
import '../../accountFeature/ui/widgets/account_text.dart';
import '../../productDetailsFeature/ui/widgets/app_bar_leading.dart';
import '../../productDetailsFeature/ui/widgets/app_bar_title.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
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
          AccountText(
            title: 'ORDER SUMMARY',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
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
                        child: Row(
                          children: [
                            Text('Total '),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  'EGP',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                5.horizontalSpace,
                                Text(
                                  '8000.0',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        child: Row(
                          children: [
                            Text('Delivery Fees'),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  'EGP',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                5.horizontalSpace,
                                Text(
                                  '35.0',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        child: Row(
                          children: [
                            Text('International Custom Fees'),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  'EGP',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                5.horizontalSpace,
                                Text(
                                  '195.0',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          color: AppColors.grey.shade300,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 3.h),
                        child: Row(
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Text(
                                  'EGP',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                5.horizontalSpace,
                                Text(
                                  '8000.0',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
                Button(
                    appColors: appColors,
                    title: 'CONFIRM ORDER',
                    onPressed: (){

                      deleteCart();
                    },
                    width: double.infinity,
                    color: appColors.secondColor,
                    backgroundColor:AppColors.appBarActive,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
  Future<void> deleteCart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('flutter-cart');
    DocumentReference cartRef = _collectionRef.doc(currentUser!.uid);

    cartRef.delete().then((event) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ConfirmOrder()));
      print("delete suc");
    });

  }
}
