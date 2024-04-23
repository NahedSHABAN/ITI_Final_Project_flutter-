import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/core/utils/constants/app_colors.dart';
import '../../../../core/router/layout/bottom_nav_bar.dart';
import '../../../Cart/Data/models/cart_products_model.dart';
import '../../../helpFeature/ui/widgets/LiveChatButton.dart';
import '../../../homeFeature/Data/models/product_model.dart';
import 'bordered_icon_button.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.product}); // Constructor with Key parameter

  static const appColors = AppColors();
  final Product product;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void initState() {
    getProducts().then((value) {
      products = [];
      return products = value;
    });
    getCart();
    super.initState();
  }

  List<Product> products = [];
  int myCurrentIndex = 0;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<Product>> getProducts() async {
    QuerySnapshot querySnapshot = await _firestore.collection('test').get();
    List<Product> products = [];
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      try {
        products.add(Product.fromJson(data));
      } catch (e) {}
    }

    return products;
  }

  Future<List<dynamic>> convertSnapshotToList(DocumentSnapshot snapshot) async {
    // Extract data from the snapshot
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    // Convert the data to a list
    List<dynamic> dataList = data.values.toList();

    // Optionally, you can further process or manipulate the list here

    return dataList;
  }
  late CartProducts? cartProducts;
  List<CartProducts> cartProductsList=[];

  Future<void> getCart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('cart');
    DocumentReference cartRef = _collectionRef.doc(currentUser!.uid);

    cartRef.snapshots().listen((event) {
      print('event $event');
      Map<String, dynamic>? eventData = event.data() as Map<String, dynamic>?; // Explicit casting
      if (eventData != null) {
        List<dynamic> productsData = eventData['products'];
        cartProductsList=[];
        for (var productData in productsData) {
          cartProductsList.add(CartProducts.fromJson(productData));
        }
        cartProducts = CartProducts.fromJson(productsData.first);
        print('productsData: ${productsData.first}');
        print('cartProductsList: $cartProductsList');
        print('cart: $cartProducts');
      }
    });
  }

  Future<void> addCart(String productId, int quantity) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('flutter-cart');
    try{
      DocumentReference cartRef = _collectionRef.doc(currentUser!.uid);

      // Check if the user has a cart document
      dynamic cardtData = await cartRef.get();
      print('cartData ${cardtData['products']}');
      DocumentSnapshot cartSnapshot = await cartRef.get();
      if (cartSnapshot.exists) {
        List<dynamic> products = await convertSnapshotToList(cartSnapshot);
        int index = 0;
        int existingIndex = products.indexWhere((item) {
          index=0;
          for (var ite in item) {

            print('ite $ite');
            print('id ${ite['products']['id']}');
            String id = ite['products']['id']; // Assuming it's 'product' instead of 'products'
            // Check if the id matches the productId
            if (id == productId) {
              print('selected item $ite');
              return true; // Product with productId found
            }
            index++;
          }
          return false; // Product with productId not found
        });

        bool isExist = existingIndex != -1;
        if (isExist ) {
          print('in if');
          print('index $index');
          print('index $existingIndex');
          print('qnt : ${products[0][index]['quntity']}');
          products[0][index]['quntity'] +=quantity ;
          // products[existingIndex]['quantity'] += quantity;
          _collectionRef.doc(currentUser!.uid).update({
            'products': products.first
          }).then((value) => print('update to cartx'));
        } else {
          print('in else');

          _collectionRef.doc(currentUser!.uid).set({
            'products': FieldValue.arrayUnion([
              {
                'products': {
                  'title': widget.product.title,
                  'images': widget.product.images?.first,
                  'price': widget.product.price,
                  'quantityInStock': widget.product.quantityInStock,
                  'id': widget.product.proId,
                },
                'quntity': 1
              }
            ])
          },SetOptions(merge: true)).then((value) => print('added to cart'));
          print('Cart created and item added successfully.');
        }

        print('Cart updated successfully.');
      } else {
        // User doesn't have a cart, create one and add the product
        _collectionRef.doc(currentUser!.uid).set({
          'products': FieldValue.arrayUnion([
            {
              'products': {
                'title': widget.product.title,
                'images': widget.product.images?.first,
                'price': widget.product.price,
                'quantityInStock': widget.product.quantityInStock,
                'id': widget.product.proId,
              },
              'quntity': 2
            }
          ])
        },SetOptions(merge: true)).then((value) => print('added to cart'));
        print('Cart created and item added successfully.');
      }
    }catch(e){
      _collectionRef.doc(currentUser!.uid).set({
        'products': FieldValue.arrayUnion([
          {
            'products': {
              'title': widget.product.title,
              'images': widget.product.images?.first,
              'price': widget.product.price,
              'quantityInStock': widget.product.quantityInStock,
              'id': widget.product.proId,
            },
            'quntity': 2
          }
        ])
      },SetOptions(merge: true)).then((value) => print('added to cart'));
      print('Cart created and item added successfully.');
    }

  }

  Future addToCart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('flutter-cart');
    return _collectionRef.doc(currentUser!.uid).set({
      'products': FieldValue.arrayUnion([
        {
          'products': {
            'title': widget.product.title,
            'images': widget.product.images?.first,
            'price': widget.product.price,
            'quantityInStock': widget.product.quantityInStock,
            'id': widget.product.proId,
          },
          'quntity': 2
        }
      ])
    },SetOptions(merge: true)).then((value) => print('added to cart'));
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BorderedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const BottomNavBar()));
            },
            appColors: const AppColors(),
            width: 50.w,
            color: AppColors.appBarActive,
            backgroundColor: CustomBottomNavigationBar.appColors.secondColor,
            icon: Icons.home_outlined,
            borderWidth: 1.w,
            borderColor: AppColors.appBarActive,
          ),
          LiveButton(
            backgroundColor: AppColors.appBarActive,
            color: CustomBottomNavigationBar.appColors.secondColor,
            width: 270.w,
            appColors: const AppColors(),
            onPressed: () {
              addCart(widget.product.proId.toString(),0);
            },
            title: 'ADD TO CART',
            icon: Icons.add_shopping_cart_outlined,
          )
        ],
      ),
    );
  }
}
