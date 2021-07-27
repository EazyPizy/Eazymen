import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/Widgets/Variant_Card_Widget.dart';
import 'package:flutter_auth_provider/providers/product_variant_provider.dart';
import 'package:provider/provider.dart';

class ProductVariant extends StatefulWidget {
  @override
  _ProductVariantState createState() => _ProductVariantState();
}

class _ProductVariantState extends State<ProductVariant> {
  @override
  Widget build(BuildContext context) {
    var onTap = Provider.of<ProductVariantProvider>(context, listen: false);
    String prodId = onTap.prodId;
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Products')
            .doc(prodId)
            .collection('Product Variants')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot document = snapshot.data.docs[index];
                    return VariantCardWidget(
                        document['Size'],
                        document['Color'],
                        document['Price'],
                        document['Discount Price']);
                  },
                );
          }
          return Container(
            child: ElevatedButton(
              child: Text("Press Me"),
            ),
          );
        },
      ),
    );
  }
}
