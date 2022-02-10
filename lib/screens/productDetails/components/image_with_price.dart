import 'package:flutter/material.dart';
class ImageWithPrice extends StatelessWidget {
  const ImageWithPrice({Key? key,this.price,this.image}) : super(key: key);
  final String?  price;
  final String ? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(left: 16,right: 16,top: 140),
      child: Row(

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Price',style: TextStyle(color: Colors.white),),
              Text(price??"0.0",style: const TextStyle(color: Colors.white,fontSize: 25))
            ],
          ),
          const Spacer(),
          Expanded(
              child: Image.asset(
                image??""))
        ],
      ),
    );
  }
}
