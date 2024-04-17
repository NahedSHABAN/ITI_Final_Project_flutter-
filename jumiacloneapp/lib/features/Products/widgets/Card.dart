import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/features/Products/widgets/Rating.dart';
import '../../../../core/utils/constants/app_colors.dart';
import 'AddButton.dart';
import 'Badge1.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.appColors,
    required this.rating,
  });

  final String productName;
  final String productPrice;
  final String productImage;
  final AppColors appColors;
  final double rating;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {


  @override

  Widget build(BuildContext context) {
    return Card(
      color: widget.appColors.secondColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                   widget.productImage,
                  height: 110.h,
                  width: double.infinity,
                ),
                const Positioned(
                  top: 5,
                  left: 2,
                  child: Badge1(title: 'Non-Returnable'),
                ),
              ],
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: TextStyle(
                      fontSize: 10,
                      color: widget.appColors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'EGP ${widget.productPrice}',
                    style: TextStyle(
                      fontSize: 15,
                      color: widget.appColors.black,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Rating(rating: widget.rating),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(child: AddButton()),
          ],
        ),
      ),
    );
  }
}
