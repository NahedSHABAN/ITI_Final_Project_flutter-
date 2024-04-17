import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../productDetailsFeature/ui/product_details_screen.dart';
import '../../Data/models/product_model.dart';

class Sale_Card extends StatelessWidget {
  const Sale_Card({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productSale,
    required this.appColors,
    required this.product
  });

  final AppColors appColors;
  final String productName;
  final String productPrice;
  final String productImage;
  final String productSale;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>  ProductDetails(product: product,)));
      },
      child: Container(
        color: appColors.secondColor,
        // height: 170.h,
        width: 145.w,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Image.network(
                    productImage,
                    height: 120.h,
                    width: 140.w,
                  ),
                  Container(
                    color: appColors.saleColor,
                    height: 20.h,
                    width: 40.w,
                    child: Center(
                      child: Text(
                        '-$productSale%',
                        style: TextStyle(
                          color: appColors.saleText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
               Column(
                children: [
                  Text(
                    productName,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    productPrice+" "+"EGP".tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}