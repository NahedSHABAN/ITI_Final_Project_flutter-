import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/features/Products/Products.dart';
import 'package:jumia/features/homeFeature/ui/widgets/products_slider.dart';
import 'package:jumia/features/homeFeature/ui/widgets/sale_ctegory.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/constants/home_screen_consts.dart';
import '../../Data/models/product_model.dart';
import 'banner.dart';
import 'category_slider.dart';
import 'center_banner.dart';
import 'center_image.dart';
import 'center_slider.dart';

class SaleSection extends StatefulWidget {
  SaleSection({
    super.key,
    required this.appColors,
  });

  final AppColors appColors;


  @override
  State<SaleSection> createState() => _SaleSectionState();
}

class _SaleSectionState extends State<SaleSection> {
  static const appColors = AppColors();
  void initState() {
    // getProducts().then((value) {
    //   products=[];
    //   return products = value;
    // });
    // super.initState();
    super.initState();
    // Call getProducts function to fetch products data
    getProducts().then((value) {
      setState(() {
        products = value;
      });
    });
  }


  List<Product> products = [];
  int myCurrentIndex = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> getProducts() async {
    QuerySnapshot querySnapshot = await _firestore.collection('test').get();
    List<Product> products = [];
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      try{
        products.add(Product.fromJson(data));
      }
      catch(e){}
    }

    return products;
  }



  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        CategorySlider(
          images: homeSlider,
          appColors: widget.appColors,
        ),
        CarouselContainer(
          space: 7.w,
          imagePaths: homeSlider2,
          containerColor: widget.appColors.secondColor,
        ),
        CategorySlider(
          images: homeSlider1,
          appColors: widget.appColors,
        ),
        CenterImage(
          appColors: const AppColors(),
          image: 'assets/images/HomeCenter/2.png',
          color: widget.appColors.secondColor,
        ),
        SaleCategory(
          appColors: const AppColors(),
          images: saleImages1,
        ),
        CategoryBanner(
          colors: const AppColors(),
          title: 'L\'Oreal'.tr(),
          color: widget.appColors.bannerColor,
          bottonTitle: 'SEE ALL'.tr(),
          bottonColor: widget.appColors.black,
          titleColor: widget.appColors.black,
        ),
        ProductSlider(
          productsData:products,
          appColors: appColors,
        ),
        CenterBanner(
          colors: const AppColors(),
          title: 'Ramadan Preparations'.tr(),
          postfix_icon: 'assets/images/thin-moon.png',
          color: widget.appColors.bannerColor,
        ),
      ],
    );
  }
}
