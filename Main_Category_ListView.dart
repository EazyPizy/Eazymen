import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/Widgets/Main_Category_Card.dart';
import 'package:flutter_auth_provider/providers/main_category_provider.dart';
import 'package:provider/provider.dart';

class MainCategoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainCategoryData = Provider.of<MainCategoryProvider>(context);
    final mainCategory = mainCategoryData.mainCategoryItems;
    return ListView.builder(
        itemCount: mainCategory.length,
        itemBuilder: (ctx, i) => MainCategoryCard(
              mainCategory[i].mainCategoryTitle,
              mainCategory[i].mainCategoryId,
            ));
  }
}
