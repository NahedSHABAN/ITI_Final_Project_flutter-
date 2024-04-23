import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/features/homeFeature/Data/models/product_model.dart';
import 'package:jumia/features/productDetailsFeature/ui/widgets/product_name.dart';
import 'package:jumia/features/productDetailsFeature/ui/widgets/product_price.dart';
import 'package:jumia/features/productDetailsFeature/ui/widgets/rating_section.dart';

import '../../../../core/utils/constants/app_colors.dart';
import 'brand_name.dart';
import 'left_units.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({
    super.key,
    required this.appColors, required this.product,
  });

  final AppColors appColors;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: appColors.secondColor,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             ProductName(
              title:product.title??'',
            ),
            5.verticalSpace,
             BrandName(
              title:product.brand??'',
            ),
            5.verticalSpace,
             ProductPrice(
              price: product.price.toString(),
            ),
            5.verticalSpace,
             LeftUnits(appColors: AppColors(), units: product.quantityInStock.toString()),
            5.verticalSpace,
            const Text(
              'Delivery fees from EGP 20.00 to 6th of october. Save 10 EGP on shipping with prepaid payment',
              overflow:TextOverflow.visible,
            ),
            10.verticalSpace,
            RatingSection(appColors: appColors),
            


          ],
        ),
      ),
    );
  }
}
