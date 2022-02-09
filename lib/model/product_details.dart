import 'dart:convert';

List<ProductDetails> productDetailsFromJson(String str) => List<ProductDetails>.from(json.decode(str).map((x) => ProductDetails.fromJson(x)));

class ProductDetails {
  ProductDetails({
    this.name,
    this.color,
    this.image,
    this.price,
    this.size,
    this.description
  });

  String? name;
  String? color;
  String? image;
  int? price;
  int? size;
  String? description;

  factory ProductDetails.fromJson(Map<String, dynamic> json) => ProductDetails(
    name: json["name"],
    color: json["color"] ,
    image: json["image"],
    price: json["price"],
    size: json['size'],
    description: json['description']
  );


}
