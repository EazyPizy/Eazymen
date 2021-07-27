import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/screens/subCategory_screen.dart';

class SubCategoryCard extends StatelessWidget {
  final String id;
  final String subCategory;
  final String imageUrl;
  final List<String> mainCategoryId;
  final String categoryId;
  final String categoryTitle;

  SubCategoryCard(this.subCategory, this.id, this.imageUrl, this.mainCategoryId,
      {this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(SubCategoriesScreen.routeName, arguments: {
          "Main CategoryId": categoryId,
          "Main CategoryTitle": categoryTitle,
        }
        );
      },
      child: Card(
          elevation: 5,
          child: Container(
            height: 150,
            width: 120,
            child: Column(children: [
              Container(
                // color: Colors.amber,
                height: 30,
                child: Text(
                  id,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
              Container(
                color: Colors.amber,
                height: 110,
                width: 110,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              )
            ]),
          )),
    );
  }
}
