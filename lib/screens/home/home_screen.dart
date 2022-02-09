import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project_2/repositories/product_repositories.dart';
import 'package:test_project_2/screens/ui_elements/custom_app_bar.dart';
import '../home/homeComponents/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ["Jewellery", "Clothes", "Beauty", "Shoes", 'Bags'];
  int selectedIndex = 0;
  // var currentIndex;
  // late Color productColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar:const  CustomAppBar(),
      body: buildBodyItems(context),
    );
  }

  Widget buildBodyItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Women",
            style: Theme
                .of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (ctx, index) => buildCategoryItem(index)),
          ),
          buildProductView()
        ],
      ),
    );
  }

  Widget buildProductView() {
    return FutureBuilder(
      future: ProductRepository().getProduct(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return const Text('Error Occured');
        } else if (snapshot.hasData) {
          var productResponse = snapshot.data! as List;
          print(productResponse[0].color);
          // productColor = int.parse(productResponse[currentIndex].color) as Color;


          return Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.86,
                ),

                itemCount: productResponse.length,
                itemBuilder: ((context, index) {
                  // currentIndex= index;
                  return ProductCard(
                    name: productResponse[index].name,
                    image: productResponse[index].image,
                    price: productResponse[index].price.toString(),
                    color: productResponse[index].color,
                    index: index,
                  );
                }

                )
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }

  Widget buildCategoryItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
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
