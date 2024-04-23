import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jumia/features/Products/widgets/Rating.dart';
import '../../../../core/utils/constants/app_colors.dart';
import 'AddButton.dart';
import 'Badge1.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.appColors,
    required this.rating,
  });

  final String productName;
  final String productPrice;
  final String productImage;
  final AppColors appColors;
  final double rating;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // Future<void> addCart(String productId, int quantity) async {
  //   final FirebaseAuth _auth = FirebaseAuth.instance;
  //   var currentUser = _auth.currentUser;
  //   CollectionReference _collectionRef = FirebaseFirestore.instance.collection('flutter-cart');
  //   DocumentReference cartRef = _collectionRef.doc(currentUser!.uid);
  //
  //   // Check if the user has a cart document
  //   dynamic cardtData = await cartRef.get();
  //   print('cartData ${cardtData['products']}');
  //   DocumentSnapshot cartSnapshot = await cartRef.get();
  //   if (cartSnapshot.exists) {
  //     List<dynamic> products = await convertSnapshotToList(cartSnapshot);
  //     int index = 0;
  //     int existingIndex = products.indexWhere((item) {
  //       index=0;
  //       for (var ite in item) {
  //
  //         print('ite $ite');
  //         print('id ${ite['product']['id']}');
  //         String id = ite['product']['id']; // Assuming it's 'product' instead of 'products'
  //         // Check if the id matches the productId
  //         if (id == productId) {
  //           print('selected item $ite');
  //           return true; // Product with productId found
  //         }
  //         index++;
  //       }
  //       return false; // Product with productId not found
  //     });
  //
  //     bool isExist = existingIndex != -1;
  //     if (isExist ) {
  //       print('in if');
  //       print('index $index');
  //       print('index $existingIndex');
  //       print('qnt : ${products[0][index]['quantity']}');
  //       products[0][index]['quantity'] +=quantity ;
  //       // products[existingIndex]['quantity'] += quantity;
  //       _collectionRef.doc(currentUser!.uid).update({
  //         'products': products.first
  //       }).then((value) => print('update to cartx'));
  //     } else {
  //       print('in else');
  //
  //       _collectionRef.doc(currentUser!.uid).set({
  //         'products': FieldValue.arrayUnion([
  //           {
  //             'product': {
  //               'title': widget.product.title,
  //               'images': widget.product.images?.first,
  //               'price': widget.product.price,
  //               'quantityInStock': widget.product.quantityInStock,
  //               'id': widget.product.proId,
  //             },
  //             'quantity': 1
  //           }
  //         ])
  //       },SetOptions(merge: true)).then((value) => print('added to cart'));
  //       print('Cart created and item added successfully.');
  //     }
  //
  //     print('Cart updated successfully.');
  //   } else {
  //     // User doesn't have a cart, create one and add the product
  //     _collectionRef.doc(currentUser!.uid).set({
  //       'products': FieldValue.arrayUnion([
  //         {
  //           'products': {
  //             'title': widget.product.title,
  //             'images': widget.product.images?.first,
  //             'price': widget.product.price,
  //             'quantityInStock': widget.product.quantityInStock,
  //             'id': widget.product.proId,
  //           },
  //           'quntity': 2
  //         }
  //       ])
  //     },SetOptions(merge: true)).then((value) => print('added to cart'));
  //     print('Cart created and item added successfully.');
  //   }
  // }
  //
  // Future<List<dynamic>> convertSnapshotToList(DocumentSnapshot snapshot) async {
  //   // Extract data from the snapshot
  //   Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
  //
  //   // Convert the data to a list
  //   List<dynamic> dataList = data.values.toList();
  //
  //   // Optionally, you can further process or manipulate the list here
  //
  //   return dataList;
  // }

  @override

  Widget build(BuildContext context) {
    return Card(
      color: widget.appColors.secondColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                   widget.productImage,
                  height: 110.h,
                  width: double.infinity,
                ),
                const Positioned(
                  top: 5,
                  left: 2,
                  child: Badge1(title: 'Non-Returnable'),
                ),
              ],
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.productName,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 10,
                            overflow: TextOverflow.ellipsis,
                            color: widget.appColors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'EGP ${widget.productPrice}',
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 15,
                            overflow: TextOverflow.ellipsis,
                            color: widget.appColors.black,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Rating(rating: widget.rating),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // const Center(child: AddButton()),
          ],
        ),
      ),
    );
  }
}
