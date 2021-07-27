import 'package:flutter/material.dart';
import 'package:flutter_auth_provider/providers/sub_category_provider.dart';
import 'package:provider/provider.dart';

class SubCategoryChipCard extends StatelessWidget {
  final String id;
  final String subCategory;
  final String imageUrl;
  final List<String> mainCategoryId;
  final bool isSelected;
  final int index;
  final VoidCallback onSelect;

  SubCategoryChipCard(
      this.id, this.subCategory, this.imageUrl, this.mainCategoryId,{
        this.index, this.onSelect,this.isSelected
  }
  );

  @override
  Widget build(BuildContext context) {
    var onTap = Provider.of<SubCategoryProvider>(context, listen: false);

    return InkWell(
        onTap: () {
          onSelect();
          onTap.valueSetter(id);
        },
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Container(
              decoration: isSelected
                  ? BoxDecoration(
                  border: Border.all(color: Colors.blue))
                  : BoxDecoration(),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: 70,
                          width: 70,
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Text(
                          subCategory,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
