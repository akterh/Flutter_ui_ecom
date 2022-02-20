import 'package:flutter/material.dart';
import 'package:test_project_2/screens/productDetails/product_details.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.grey),
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      // home: const HomePage(),
      initialRoute: '/',
      routes: {
        '/':(context)=> HomePage(),
        ProductDetails.routeName:(ctx)=> ProductDetails()

      },
    );
  }
}

