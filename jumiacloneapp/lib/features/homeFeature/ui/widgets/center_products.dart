import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/features/homeFeature/Data/models/product_model.dart';
import 'package:jumia/features/homeFeature/ui/widgets/sale_card.dart';

import '../../../../core/utils/constants/app_colors.dart';

class CenterProducts extends StatelessWidget {
  const CenterProducts({
    super.key,
    required this.appColors,
    required this.image1,
    required this.image2,
    required this.product1Details,
    required this.product2Details,
  });

  final AppColors appColors;
  final String image1;
  final String image2;
  final Product product1Details;
  final Product product2Details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          width: double.infinity,
          color: appColors.secondColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Sale_Card(
                  productSale: product1Details.discountPercentage.toString(),
                  productImage: product1Details.images?.first??"",
                  productPrice: product1Details.price.toString(),
                  productName: product1Details.title.toString(),
                  appColors: appColors,
                  product: product1Details,
                ),
              ),
              SizedBox(width: 10.w), // Adjust the spacing as needed
              Expanded(
                flex: 1,
                child: Sale_Card(
                  productSale: product2Details.discountPercentage.toString(),
                  productImage: product2Details.images?.first??"",
                  productPrice: product2Details.price.toString(),
                  productName: product2Details.title.toString(),
                  appColors: appColors,
                  product:product2Details,
                ),
              ),
            ],
          ),
        ),
      ],
    );

  }
}


