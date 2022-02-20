import 'package:flutter/material.dart';
class CategoryItems extends StatefulWidget {
  const CategoryItems({Key? key,this.index,this.categories}) : super(key: key);
  final int? index;
  final List? categories;

  @override
  _CategoryItemsState createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  int selectedIndex = 0;

  // get categories => widget.categories;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // selectedIndex = index;
        setState(() {
          selectedIndex = widget.index!;
        });
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
            child: Text(
              widget.categories![widget.index!],
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Container(
              height: 3,
              width: 50,
              color: selectedIndex == widget.index ? Colors.grey : Colors.grey[200])
        ],
      ),
    );
  }
}
