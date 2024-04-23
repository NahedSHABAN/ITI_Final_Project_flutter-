import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../Cart/Cart.dart';

class AppBarActions extends StatelessWidget {
  const AppBarActions({
    super.key,
    required this.appColors, required this.quntity, required this.length,
  });

  final AppColors appColors;
  final String quntity;
  final int length;

  @override
  Widget build(BuildContext context) {
    bool showIcon = length > 0;

    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 10),
      child: Row(
        children: [
          Icon(Icons.search_sharp,
              color: appColors.secondColor),
          const SizedBox(width: 10),
          Stack(
              alignment: Alignment.topRight,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>Cart()));
                  },
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: appColors.secondColor,
                    size: 30.0, // Adjust the size as needed
                  ),
                ),
                showIcon?Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 15.w, // Adjust the width as needed
                    height: 12.h, // Adjust the height as needed
                    child: CircleAvatar(
                      backgroundColor: AppColors.appBarActive,
                      child: Text( quntity ,style: TextStyle(fontSize: 10.sp,color: appColors.secondColor,fontWeight: FontWeight.bold),),
                    ),
                  ),
                ):SizedBox(),
              ]
          ),

        ],
      ),
    );
  }
}
