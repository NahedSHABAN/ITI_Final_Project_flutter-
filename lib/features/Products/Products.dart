
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/features/homeFeature/Data/models/product_model.dart';
import 'package:jumia/features/productDetailsFeature/ui/product_details_screen.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../Cart/Cart.dart';
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
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Cart()));
            },
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
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 2.h,
                ),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ProductDetails(product: product,)));

                    },
                    child: ProductCard(
                      productImage: product.images?.first??"",
                      productPrice: product.price.toString()??'0',
                      productName: product.title??"",
                      rating: double.parse(product.rating==null?"0":product.rating.toString()??"0"),
                      appColors: Products.appColors,
                    ),
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
