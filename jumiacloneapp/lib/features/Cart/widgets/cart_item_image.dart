import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemImage extends StatelessWidget {
  const CartItemImage({
    super.key, required this.image,
  });
final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 10.h
          ),
          child: Image.network(
            image,
            height: 100.h,
            width: 120.w,
            fit: BoxFit.fill,
          ),
        )
      ],
    );
  }
}
