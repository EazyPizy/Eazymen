import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/Database_Services/Add_Product.dart';
import 'package:flutter_auth_provider/Widgets/Product_Card.dart';
import 'package:flutter_auth_provider/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductListView extends StatefulWidget {
  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  AddProductService _addProductService = AddProductService();

  @override
  void initState() {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    _addProductService.getProducts(productProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final subCategoryId = ModalRoute.of(context).settings.arguments as String;
    final productData = Provider.of<ProductProvider>(context);
    final product = productData.productItems;
    final matchedProduct = product.where((element) {
      return element.subCategoryId.contains(subCategoryId);
    }).toList();
    return ListView.builder(
        itemCount: matchedProduct.length,
        itemBuilder: (ctx, i) => ProductCard(
          matchedProduct[i].productName,
          matchedProduct[i].imageURLs.first,
          matchedProduct[i].subCategoryTitle.first,
          matchedProduct[i].subCategoryId.first,
          matchedProduct[i].sellingPrice,
          matchedProduct[i].productId,
          matchedProduct[i].productCommission,
            ));
  }
}
