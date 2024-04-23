import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/features/Products/Products.dart';

import '../../../../core/utils/constants/app_colors.dart';
import 'all_products_banner.dart';
import 'category_container.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({
    super.key,
    required this.appColors,
    required this.saleImages1,
    required this.titles,
    required this.index
  });

  final AppColors appColors;
  final List<String> saleImages1;
  final List<String> titles;
  final double index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: double.infinity,
        color: appColors.primaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AllProductsBanner(
                appColors: appColors,
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Products()));
                },
              ),
              10.verticalSpace,
              index ==0?
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){return CategoryContainer(appColors: appColors, saleImages1: saleImages1, titles: titles);},
                  separatorBuilder: (context,index){return 10.verticalSpace;},
                  itemCount: 3,
                shrinkWrap: true,
              ):
              SizedBox()
          
            ],
          ),
        ),
      ),
    );
  }
}
