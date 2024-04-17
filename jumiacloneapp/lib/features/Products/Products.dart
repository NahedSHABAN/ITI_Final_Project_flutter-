
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../core/utils/constants/home_screen_consts.dart';
import 'widgets/FilterBar.dart';
import 'widgets/card.dart';

class Products extends StatefulWidget {
  const Products({super.key});
  static const appColors = AppColors();


  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All Products',
          style: TextStyle(color: Products.appColors.secondColor),
        ),
        backgroundColor: AppColors.appBarColor,
        iconTheme: IconThemeData(color: Products.appColors.secondColor),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Products.appColors.secondColor,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
            color: Products.appColors.secondColor,
          ),
        ],
      ),
      body: Column(
        children: [
          const FilterBar(),
          Expanded(
            child: Container(
              color: Products.appColors.primaryColor,
              child: GridView.builder(

                shrinkWrap: true,
                gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 2.h,
                ),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = products[index];
                  return ProductCard(
                    productImage: product['image'],
                    productPrice: product['price'],
                    productName: product['name'],
                    rating: product['rating'],
                    appColors: Products.appColors,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
