import 'package:flutter/material.dart';
import 'package:jumia/features/homeFeature/Data/models/product_model.dart';
import 'package:jumia/features/homeFeature/ui/widgets/sale_card.dart';
import '../../../../core/utils/constants/app_colors.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({
    Key? key,
    required this.appColors,
    required this.productsData
  }) : super(key: key);

  final AppColors appColors;
  final List<Product> productsData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: appColors.secondColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(7),
          topRight: Radius.circular(7),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: productsData.map((product) {
            return _buildSaleCard(
              productSale: product.discountPercentage.toString(),
              productImage: product.images?.first??'',
              productName: product.title.toString(),
              productPrice: product.price.toString(),
              product: product,

            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildSaleCard({
    required String productSale,
    required String productImage,
    required String productName,
    required String productPrice,
    required Product product
  }) {
    return Sale_Card(
      productSale: productSale,
      productImage: productImage,
      productName: productName,
      productPrice: productPrice,
      appColors: appColors,
      product: product,
    );
  }
}

