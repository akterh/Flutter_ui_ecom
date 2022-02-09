import 'dart:convert';
List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

class Product {
  Product({
    this.name,
    this.color,
    this.image,
    this.price,
  });

  String? name;
  String? color;
  String? image;
  int? price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    color: json["color"] ,
    image: json["image"],
    price: json["price"],
  );


}
