import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/core/utils/constants/app_colors.dart';
import 'package:jumia/features/productDetailsFeature/ui/widgets/product_rating_container.dart';
import '../../homeFeature/Data/models/product_model.dart';
import 'widgets/app_bar_actions.dart';
import 'widgets/app_bar_leading.dart';
import 'widgets/app_bar_title.dart';
import 'widgets/custom_botton_nav_bar.dart';
import 'widgets/customer_view.dart';
import 'widgets/delivery_section.dart';
import 'widgets/details_section.dart';
import 'widgets/product_s;ider.dart';
import 'widgets/promotion_section.dart';


class ProductDetails extends StatefulWidget {
  ProductDetails(
      {
        super.key,
        required this.product,

      });
  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int cartProductsLength = 0;

  void initState() {
    super.initState();
    getProducts().then((value) {
      setState(() {
        products = value;
      });
    });
    updateCartLength();

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

  Future<int> getCartLength() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('flutter-cart');
    DocumentReference cartRef = _collectionRef.doc(currentUser!.uid);

    // Fetch the cart data
    DocumentSnapshot cartSnapshot = await cartRef.get();
    Map<String, dynamic>? cartData =
    cartSnapshot.data() as Map<String, dynamic>?;

    // Check if cart data is available
    if (cartData != null && cartData.containsKey('products')) {
      List<dynamic> productsData = cartData['products'];
      return productsData.length;
    } else {
      // If cart data is not available or if products list is empty, return 0
      return 0;
    }
  }

  Future<void> updateCartLength() async {
    int length = await getCartLength();
    setState(() {
      cartProductsLength = length;
    });
  }


  @override
  Widget build(BuildContext context) {
    print('length :${cartProductsLength}');
    return Scaffold(
        backgroundColor: appColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.appBarColor,
          actions:  [
            AppBarActions(appColors: appColors,  quntity: '$cartProductsLength',
              length: cartProductsLength,),
          ],
          title: const AppBarTitle(appColors: appColors, title: 'Details',),
          leading: const AppBarLeading(appColors: appColors),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ProductSlider1(
                imagePaths: widget.product.images??[],
                containerColor: appColors.secondColor,
                space: 5,
              ),
              8.verticalSpace,
              DetailsSection(
                  appColors: appColors,
                product: widget.product,

              ),
              8.verticalSpace,
              const PromotionsSection(
                  appColors:AppColors()
              ),
              8.verticalSpace,
              const DeliverySection(
                appColors: AppColors(),
              ),
              8.verticalSpace,
              CustomerVeiw(
                  appColors: appColors,
                title: 'Customers also viewed',
                bottonTitle: '',
              ),
              8.verticalSpace,
              const ProductRatingContainer(appColors: appColors),
              8.verticalSpace,
              CustomerVeiw(
                  appColors: appColors,
                title: 'You may also like',
                bottonTitle: '',
              ),
              8.verticalSpace,
               CustomerVeiw(
                appColors: appColors,
                title: 'Recently Viewed',
                bottonTitle: 'SEE ALL',
              ),
              8.verticalSpace
            ],
          ),
        ),
        bottomNavigationBar:  CustomBottomNavigationBar(product: widget.product,));
  }
}




