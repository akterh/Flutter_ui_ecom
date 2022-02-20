import 'package:flutter/material.dart';

class CategoryItems extends StatefulWidget {
  const CategoryItems({Key? key}) : super(key: key);

  @override
  _CategoryItemsState createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  List<String> categories = ["Jewellery", "Clothes", "Beauty", "Shoes", 'Bags'];
  int selectedIndex = 0;

  // get categories => widget.categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (ctx, index) => buildCatItems(index, categories)),
    );
  }

  Widget buildCatItems(index, categories) {
    return GestureDetector(
      onTap: () {
        // selectedIndex = index;
        setState(() {
          selectedIndex = index;
        });
        print(index);
        print(selectedIndex);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
            child: Text(
              categories[index],
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Container(
              height: 3,
              width: 50,
              color: selectedIndex == index ? Colors.grey : Colors.grey[200])
        ],
      ),
    );
  }
}
