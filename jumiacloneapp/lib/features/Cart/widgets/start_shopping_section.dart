import 'package:flutter/material.dart';

import 'CartContainer.dart';
import 'ShoppingButton.dart';

class StartShoppingSection extends StatelessWidget {
  const StartShoppingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: CartContainer(),
        ),
        ShoppingButton(),
      ],
    );
  }
}
