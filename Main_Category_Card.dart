import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/Database_Services/sub_category_service.dart';
import 'package:flutter_auth_provider/providers/sub_category_provider.dart';
import 'package:provider/provider.dart';
import 'Sub_Category_Card.dart';

class MainCategoryCard extends StatefulWidget {
  final String mainCategoryId;
  final String mainCategoryTitle;

  MainCategoryCard(
    this.mainCategoryId,
    this.mainCategoryTitle,
  );

  @override
  _MainCategoryCardState createState() => _MainCategoryCardState();
}

class _MainCategoryCardState extends State<MainCategoryCard> {
  SubCategoryService _addSubCategoryService = SubCategoryService();

  @override
  void initState() {
    SubCategoryProvider subCategoryProvider =
        Provider.of<SubCategoryProvider>(context, listen: false);
    _addSubCategoryService.getSubCategory(subCategoryProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
          onTap: () {},
          child: Stack(
            children: <Widget>[
              Container(
                color: Colors.white,
                height: 200,
                //width: double.infinity,
                //fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 10,
                right: 5,
                child: Container(
                  color: Colors.white,
                  width: 200,
                  child: Text(
                    widget.mainCategoryId,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
              Container(
                color: Colors.white70,
                height: 150,
                child: buildSubCat(),
              )
            ],
          ),
        ),
      ),
    ]);
  }

  Widget buildSubCat() {
    final subCategoryData = Provider.of<SubCategoryProvider>(context);
    final subCategory = subCategoryData.subCategoryItems;
    final name = widget.mainCategoryTitle;
    final findId = subCategory.where((element) {
      return element.mainCategoryId.contains(name);
    }).toList();
    return ListView.builder(
        //shrinkWrap: true,

        scrollDirection: Axis.horizontal,
        itemCount: findId.length,
        itemBuilder: (context, index) => SubCategoryCard(
              findId[index].subCategoryId,
              findId[index].subCategoryTitle,
              findId[index].imageURL,
              findId[index].mainCategoryId,
              categoryId: widget.mainCategoryTitle,
              categoryTitle: widget.mainCategoryId,
            ));
  }
}
