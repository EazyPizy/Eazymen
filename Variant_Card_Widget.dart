import 'package:flutter/material.dart';

class VariantCardWidget extends StatelessWidget {

   final String size;
   final String color;
 // final String productId;
 final String price;
 final String discountprice;
// final ProductVariantModel variants;

  VariantCardWidget(
    this.size,
    this.color,
    // this.productId,
      this.price,
      this.discountprice
      //this.variants,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: ListTile(
            title: Text(color),
            subtitle: Text(price),
          ),
        )
      ],
    );
  }


}
