import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/constants/app_colors.dart';
import 'cart_item_details.dart';
import 'cart_item_image.dart';
import 'crud_bottons.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.appColors,
    required this.price,
    required this.units,
    required this.title,
    required this.image,
    required this.id,
    required this.quantity,
    required this.onQtyChanged,
    required this.remove,
  });

  final AppColors appColors;
  final String price;
  final String units;
  final String title;
  final String image;
  final String id;
  final int quantity;
  final Function(int) onQtyChanged;
  final Function() remove;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: appColors.secondColor,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CartItemImage(
                  image: image,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: CartItemDetails(
                    appColors: appColors,
                    title: title,
                    price: price,
                    units: units,
                  ),
                ),
              ],
            ),
            CrudBottons(
              appColors: appColors,
              id: id,
              quantity: quantity,
              onQtyChanged: onQtyChanged,
              remove: remove,
            )
          ],
        ),
      ),
    );
  }
}
