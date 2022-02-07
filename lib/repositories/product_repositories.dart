import 'package:flutter/services.dart';
import 'package:test_project_2/model/products.dart';
class ProductRepository{
  Future<List<Product>> getProduct() async{
    final response = await rootBundle.loadString(
        'assets/data/products.json');
    // print(productFromJson(response));
    return productFromJson(response);
  }
}
