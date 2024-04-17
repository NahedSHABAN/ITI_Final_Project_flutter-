import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../homeFeature/Data/models/product_model.dart';
import '../../productDetailsFeature/ui/widgets/customer_view.dart';
import '../Cart.dart';

class CustomerProductSection extends StatefulWidget {
  const CustomerProductSection({
    super.key,
  });

  @override
  State<CustomerProductSection> createState() => _CustomerProductSectionState();
}

class _CustomerProductSectionState extends State<CustomerProductSection> {
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
        CustomerVeiw(
          appColors: Cart.appColors,
          title: 'Recently Viewed',
          bottonTitle: 'SEE ALL',
        ),
        10.verticalSpace,
        CustomerVeiw(
          appColors: Cart.appColors,
          title: 'Recommended for you',
          bottonTitle: 'SEE ALL',
        ),
      ],
    );
  }
}
