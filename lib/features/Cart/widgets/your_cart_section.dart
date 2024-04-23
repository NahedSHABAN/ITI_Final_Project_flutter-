import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/constants/app_colors.dart';
import '../../accountFeature/ui/widgets/account_text.dart';
import '../../checkoutFeature/ui/check_out.dart';
import '../../helpFeature/ui/widgets/LiveChatButton.dart';
import '../../productDetailsFeature/ui/widgets/custom_botton_nav_bar.dart';
import '../Data/models/cart_products_model.dart';
import 'cart_item.dart';
import 'subtotal_container.dart';

class YourCartSection extends StatelessWidget {
  YourCartSection({
    Key? key,
    required this.appColors,
    required this.cartProductsList,
    required this.totalCart,
    required this.onQtyChanged,
    required this.remove,
  }) : super(key: key);

  final AppColors appColors;
  final List<CartProducts> cartProductsList;
  final double totalCart;
  final Function(String,int) onQtyChanged;
  final Function(String) remove;
  Future<void> deleteCart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection('flutter-cart');
    DocumentReference cartRef = _collectionRef.doc(currentUser!.uid);

    cartRef.delete().then((event) {
     print("delete suc");
    });

  }


  @override
  Widget build(BuildContext context) {
    int totalQuantity = 0;
    for (var cartProduct in cartProductsList) {
      totalQuantity += cartProduct.quantity;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
            vertical: 5.h,
          ),
          child: const AccountText(
            title: 'CART SUMMARY',
          ),
        ),
        SubtotalContainer(appColors: appColors, price: totalCart.toString()),
        Padding(
          padding: EdgeInsets.only(
              top: 5.h
          ),
          child: AccountText(
            title: 'CART (${ totalQuantity})',
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: cartProductsList.length,
          itemBuilder: (_, index) {
            return Column(
              children: [
                CartItem(
                  appColors: appColors,
                  price: cartProductsList[index].product.price.toString(),
                  title: cartProductsList[index].product.title,
                  units:cartProductsList[index].product.quantityInStock.toString(),
                  image: cartProductsList[index].product.images,
                  id:cartProductsList[index].product.id,
                  quantity: cartProductsList[index].quantity,
                  onQtyChanged: (int){
                    onQtyChanged(cartProductsList[index].product.id,int);
                  },
                  remove: (){
                    remove(cartProductsList[index].product.id);
                  },
                ),

              ],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: LiveButton(
            backgroundColor: AppColors.appBarActive,
            color: CustomBottomNavigationBar.appColors.secondColor,
            width: 270.w,
            appColors: const AppColors(),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CheckOut()));
            },
            title: 'CHECKOUT (EGY $totalCart)',
          ),
        )
      ],
    );
  }
}
