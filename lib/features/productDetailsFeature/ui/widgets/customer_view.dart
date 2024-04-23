import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../homeFeature/Data/models/product_model.dart';
import '../../../homeFeature/ui/widgets/banner.dart';
import '../../../homeFeature/ui/widgets/products_slider.dart';


class CustomerVeiw extends StatefulWidget {
  CustomerVeiw({
    super.key,
    required this.appColors,
    required this.title,
    required this.bottonTitle,
  });

  final AppColors appColors;
  final String title ;
  final String bottonTitle ;
  @override
  State<CustomerVeiw> createState() => _CustomerVeiwState();
}

class _CustomerVeiwState extends State<CustomerVeiw> {
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
    return Column(
      children: [
        CategoryBanner(
          titleColor: widget.appColors.black,
          colors: const AppColors(),
          title: widget.title,
          color: widget.appColors.secondColor,
          bottonTitle: widget.bottonTitle,
          bottonColor: AppColors.appBarActive,
        ),
        ProductSlider(
          productsData:products,
          appColors: appColors,
        ),


      ],
    );
  }
}
