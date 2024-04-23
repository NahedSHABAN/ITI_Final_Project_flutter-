import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/features/homeFeature/Data/models/product_model.dart';
import 'package:jumia/features/homeFeature/ui/widgets/Shop_all_images.dart';
import 'package:jumia/features/homeFeature/ui/widgets/category_slider.dart';
import 'package:jumia/features/homeFeature/ui/widgets/center_banner.dart';
import 'package:jumia/features/homeFeature/ui/widgets/flash_sale_banner.dart';
import 'package:jumia/features/homeFeature/ui/widgets/products_slider.dart';
import 'package:jumia/features/homeFeature/ui/widgets/sale_ctegory.dart';
import 'package:jumia/features/homeFeature/ui/widgets/banner.dart';
import 'package:jumia/features/homeFeature/ui/widgets/center_image.dart';
import 'package:jumia/features/homeFeature/ui/widgets/center_slider.dart';
import 'package:jumia/features/homeFeature/ui/widgets/sale_section.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../../core/utils/constants/home_screen_consts.dart';
import '../../productDetailsFeature/ui/widgets/customer_view.dart';
import 'widgets/center_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
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

  static const appColors = AppColors();
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
    return Scaffold(
      backgroundColor: appColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SaleSection(appColors: appColors),
            SaleCategory(
              appColors: const AppColors(),
              images: saleImages2,
            ),
            CenterBanner(
              colors: const AppColors(),
              title: 'Shop all Your Needs'.tr(),
              color: appColors.bannerColor,
            ),
            const ShopAllImages(
              appColors: appColors,
              image1: 'assets/images/ShopAllYouNeed/1.png',
              image2: 'assets/images/ShopAllYouNeed/2.png',
            ),
            const ShopAllImages(
              appColors: appColors,
              image1: 'assets/images/ShopAllYouNeed/3.png',
              image2: 'assets/images/ShopAllYouNeed/4.png',
            ),
            CenterImage(
              appColors: const AppColors(),
              image: 'assets/images/HomeCenter/4.jpg',
              color: appColors.secondColor,
            ),
            const FlashSaleBanner(
              appColors: AppColors(),
              hours: 9,
              minutes: 45,
              seconds: 55,
            ),
            ProductSlider(
              productsData:products,
              appColors: appColors,
            ),
            CenterBanner(
              colors: const AppColors(),
              title: 'Proudly Made In Egypt'.tr(),
              color: appColors.madeInEgypt,
              postfix_icon: 'assets/images/Icons/heart.png',
              Suffix_icon: 'assets/images/Icons/heart.png',

              // postfix_icon: ,
            ),
            CenterImage(
              appColors: const AppColors(),
              image: 'assets/images/HomeCenter/3.jpg',
              color: appColors.secondColor,
            ),
            CategoryBanner(
              titleColor: appColors.black,
              colors: const AppColors(),
              title: 'Continue Your Search',
              color: appColors.secondColor,
              bottonTitle: 'SEE ALL',
              bottonColor: AppColors.appBarActive,
            ),
            CenterProducts(
              appColors: const AppColors(),
              image1: "",
              image2: '',
              product1Details: products.isNotEmpty?products.elementAt(3):Product(),
              product2Details: products.isNotEmpty?products.last:Product(),
            ),
            CenterProducts(
              appColors: const AppColors(),
              image1: "",
              image2: '',
              product1Details: products.isNotEmpty?products.first:Product(),
              product2Details: products.isNotEmpty?products.elementAt(5):Product(),
            ),
            7.verticalSpace,
            CenterBanner(
              colors: const AppColors(),
              title: 'Best Fashion Offers',
              color: appColors.bannerColor,
            ),
            SaleCategory(
              appColors: const AppColors(),
              images: homeSale2,
            ),
            CenterBanner(
              colors: const AppColors(),
              title: 'Best Kitchen & Appliances Offers',
              color: appColors.bannerColor,
            ),
            SaleCategory(
              appColors: const AppColors(),
              images: kitchen,
            ),
            CategoryBanner(
              titleColor: appColors.black,
              colors: const AppColors(),
              title: 'Top Selling For This Week'.tr(),
              color: appColors.bannerColor,
              bottonTitle: 'SEE ALL',
              bottonColor: appColors.black,
            ),
            ProductSlider(
              productsData:products,
              appColors: appColors,
            ),
            CenterBanner(
              colors: const AppColors(),
              title: 'Best Beauty Offers',
              color: appColors.bannerColor,
            ),
            SaleCategory(
              appColors: const AppColors(),
              images: beauty,
            ),
            CenterBanner(
              colors: const AppColors(),
              title: 'Best Beauty Offers',
              color: appColors.bannerColor,
            ),
            ProductSlider(
              productsData:products,
              appColors: appColors,
            ),
            CenterImage(
                appColors: const AppColors(),
                image: 'assets/images/HomeCenter/5.png',
                color: appColors.secondColor),
            CenterBanner(
              colors: const AppColors(),
              title: 'Best Electronics Offers',
              color: appColors.bannerColor,
            ),
            SaleCategory(
              appColors: const AppColors(),
              images: elctronics,
            ),
            CategoryBanner(
              titleColor: appColors.black,
              colors: const AppColors(),
              title: 'Top Selling For This Week',
              color: appColors.bannerColor,
              bottonTitle: 'SEE ALL',
              bottonColor: appColors.black,
            ),
            ProductSlider(
              productsData:products,
              appColors: appColors,
            ),
            CenterBanner(
              colors: const AppColors(),
              title: 'Discover Our Latest Collections',
              color: appColors.bannerColor,
            ),
            const ShopAllImages(
              appColors: appColors,
              image1: 'assets/images/ShopAllYouNeed/5.png',
              image2: 'assets/images/ShopAllYouNeed/6.png',
            ),
            CenterBanner(
              colors: const AppColors(),
              title: 'Official Stores',
              color: appColors.bannerColor,
            ),
            CategorySlider(
              images: beautySlider,
              appColors: appColors,
            ),
            CenterBanner(
              colors: const AppColors(),
              title: 'More To Explore!',
              color: appColors.blue,
            ),
            CarouselContainer(
              imagePaths: saleImages3,
              containerColor: appColors.secondColor,
              space: 7.w,
            ),
            CategoryBanner(
              titleColor: appColors.black,
              colors: const AppColors(),
              title: 'L\'Oreal',
              color: appColors.bannerColor,
              bottonTitle: 'SEE ALL',
              bottonColor: appColors.black,
            ),
            ProductSlider(
              productsData:products,
              appColors: appColors,
            ),

          ],
        ),
      ),
    );
  }
}

