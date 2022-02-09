import 'package:flutter/material.dart';
class ItemCountrAndFavorite extends StatefulWidget {
  const ItemCountrAndFavorite({Key? key,this.color}) : super(key: key);
  final Color? color;

  @override
  State<ItemCountrAndFavorite> createState() => _ItemCountrAndFavoriteState();
}

class _ItemCountrAndFavoriteState extends State<ItemCountrAndFavorite> {
  int quantity = 1;
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 30,
          width: 45,
          child: IconButton(
              onPressed: () {
                setState(() {
                  quantity++;
                });
                // print(quantity);
              },
              icon: const Icon(
                Icons.add,
                size: 15,
              )),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0),
          child: Text(
            quantity.toString().padLeft(2, "0"),
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Container(
          height: 30,
          width: 45,
          child: IconButton(
              onPressed: () {
                if (quantity > 1) {
                  setState(() {
                    quantity--;
                  });
                }

                // print(quantity);
              },
              icon: const Icon(
                Icons.remove,
                size: 15,
              )),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey)),
        ),
        const Spacer(),
        Container(
          height: 35,
          width: 35,
          child: IconButton(
              onPressed: () {
                setState(() {
                  isSelect == false
                      ? isSelect = true
                      : isSelect = false;
                });
              },
              icon: Icon(
                Icons.favorite,
                size: 20,
                color: widget.color,
              )),
          decoration: isSelect == true
              ? BoxDecoration(
            color: Colors.red,
            borderRadius:
            BorderRadius.circular(20),
          )
              : BoxDecoration(
              color: Colors.white,
              borderRadius:
              BorderRadius.circular(20),
              border:
              Border.all(color: Colors.grey)),
        ),
      ],
    );
  }
}
