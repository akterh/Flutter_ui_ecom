import 'package:flutter/material.dart';
import 'package:test_project_2/repositories/product_repositories.dart';
import 'package:test_project_2/screens/productDetails/components/color_and_size.dart';
import 'package:test_project_2/screens/productDetails/components/favorite_and_quantity.dart';
import 'package:test_project_2/screens/productDetails/components/image_with_price.dart';
import 'package:test_project_2/screens/ui_elements/custom_app_bar.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/product-details';

  // const ProductDetails( this.index);
  // final int? index;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String,int?>;
    final index = routeArgs['index'];
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: ProductRepository().getProductDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Text("something Wrong");
          } else if (snapshot.hasData) {
            var productDetailsResponse = snapshot.data! as List;
            return Scaffold(
              backgroundColor:
                  Color(int.parse(productDetailsResponse[index!].color)),
              appBar: CustomAppBar(
                  color: Color(int.parse(productDetailsResponse[index].color))),
              body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Stack(
                    children: [
                      Container(
                        height: size.height,
                        margin: EdgeInsets.only(top: size.height * .31),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30))),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 80,
                              ),
                              ColorAndSize(
                                size: productDetailsResponse[index]
                                        .size
                                        .toString() +
                                    "cm",
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Text(productDetailsResponse[index].description),
                              const SizedBox(
                                height: 50,
                              ),
                              ItemCountrAndFavorite(
                                color: Color(int.parse(
                                    productDetailsResponse[index].color)),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 60,
                                    width: size.width * .15,
                                    child: IconButton(
                                        onPressed: () {
                                          // print(quantity);
                                        },
                                        icon: const Icon(
                                          Icons.shopping_cart_outlined,
                                          size: 35,
                                        )),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(color: Colors.grey)),
                                  ),
                                  SizedBox(
                                    width: size.width * .1,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('BUY NOW'),
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(int.parse(
                                            productDetailsResponse[index]
                                                .color)),
                                        fixedSize: Size(size.width * .65, 50),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20))),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      ImageWithPrice(
                        price: "\$" +
                            productDetailsResponse[index].price.toString(),
                        image: productDetailsResponse[index].image,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          productDetailsResponse[index].name,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                      )
                    ],
                  )),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          }
        });
  }
}
