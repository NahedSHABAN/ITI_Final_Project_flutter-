import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/features/Cart/widgets/customer_products_section.dart';
import 'package:jumia/features/Cart/widgets/start_shopping_section.dart';
import 'package:jumia/features/Cart/widgets/your_cart_section.dart';
import '../productDetailsFeature/ui/widgets/app_bar_leading.dart';
import '../productDetailsFeature/ui/widgets/app_bar_title.dart';
import '../../../core/utils/constants/app_colors.dart';
import 'Data/models/cart_products_model.dart';

class Cart extends StatefulWidget {
   Cart({Key? key}) : super(key: key);

  static const appColors = AppColors();


  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void initState() {
    getCart();
    super.initState();
  }
  final AppColors appColors = const AppColors();
  late CartProducts? cartProducts;
  Future<List<dynamic>> convertSnapshotToList(DocumentSnapshot snapshot) async {
    // Extract data from the snapshot
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    // Convert the data to a list
    List<dynamic> dataList = data.values.toList();

    // Optionally, you can further process or manipulate the list here

    return dataList;
  }

  Future<void> updateCart(String productId, int quantity) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('flutter-cart');
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
          print('id ${ite['product']['id']}');
          String id = ite['product']['id']; // Assuming it's 'product' instead of 'products'
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
        print('qnt : ${products[0][index]['quantity']}');
        products[0][index]['quantity']=quantity ;
        // print('asher :$products');
        // products[existingIndex]['quantity'] += quantity;
        _collectionRef.doc(currentUser.uid).update({
          'products': products.first
        }).then((value) {
          getCart();
          print('update to cartx');
        });
      } else {
        print('in else');

        print('Cart created and item added successfully.');
      }

      print('Cart updated successfully.');
    } else {
      print('Cart created and item added successfully.');
    }
  }
  List<dynamic> afterProductRemoved =[];

  Future<void> RemoveCart(String productId) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('flutter-cart');
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

          String id = ite['product']['id']; // Assuming it's 'product' instead of 'products'
          // Check if the id matches the productId
          if (id == productId) {
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
        print('qnt : ${products[0][index]['quantity']}');
        // products[0][index]['quantity'] +=quantity ;
        afterProductRemoved=products[0];
        afterProductRemoved.removeAt(index);
        // products.remove(value)
        // products[existingIndex]['quantity'] += quantity;
        _collectionRef.doc(currentUser.uid).update({
          'products': afterProductRemoved
        }).then((value) {
          getCart();
          print('update to cartx');
        });
      } else {
        print('in else');

        print('Cart created and item added successfully.');
      }

      print('Cart updated successfully.');
    } else {
      print('Cart created and item added successfully.');
    }
  }


  List<CartProducts> cartProductsList=[];
  double totalPrice =0;

  Future<void> getCart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('flutter-cart');
    DocumentReference cartRef = _collectionRef.doc(currentUser!.uid);

    cartRef.snapshots().listen((event) {
      print('event $event');
      Map<String, dynamic>? eventData = event.data() as Map<String, dynamic>?; // Explicit casting
      if (eventData != null) {
        List<dynamic> productsData = eventData['products'];
        setState(() {
          cartProductsList=[];
          totalPrice=0;
        });
        for (var productData in productsData) {
          cartProducts = CartProducts.fromJson(productData);

          setState(() {
            totalPrice+= ((cartProducts?.product.price??0)*(cartProducts?.quantity??0))??0;
            cartProductsList.add(CartProducts.fromJson(productData));

          });
        }
        setState(() {

        });
        cartProducts = CartProducts.fromJson(productsData.first);
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: const AppBarTitle(
          appColors: Cart.appColors,
          title: 'Cart',
        ),
        leading: const AppBarLeading(appColors: Cart.appColors),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Cart.appColors.primaryColor,
          child: Column(
            children: [
              cartProductsList.isEmpty?StartShoppingSection():
              YourCartSection(appColors: appColors, cartProductsList: cartProductsList, totalCart: totalPrice,
                onQtyChanged: (id,value ) {
                print('onchangeValue : $value onchangeId: $id');
                updateCart( id, value);
                },
                remove: (id ) {
                  RemoveCart(id);
                },
              ),
              10.verticalSpace,
              CustomerProductSection(),
            ],
          ),
        ),
      ),
    );
  }
}
