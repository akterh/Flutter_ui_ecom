import 'package:flutter/material.dart';
import 'package:test_project_2/screens/productDetails/product_details.dart';
class ProductCard extends StatelessWidget {
 final String? name;
 final String? price;
 final String? image;
 final String? color;
 final int? index;
 const ProductCard({Key? key,this.name,this.color,this.image,this.price,this.index }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('tapped$index');
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>ProductDetails(
                // product: products[index],
                // color: Color(int.parse(color!)),
                index: index,
              ),
            ));

      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
              color: Color(int.parse(color!)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Image.asset(
                 image!,
                height: 160,
                width: 150,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  style:
                  const TextStyle(color: Colors.grey, fontSize: 16,fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$" + price!,
                  style:
                  const TextStyle(color: Colors.grey, fontSize: 20,fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
