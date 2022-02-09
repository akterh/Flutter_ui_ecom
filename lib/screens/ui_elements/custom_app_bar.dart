import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key,this.color}) : super(key: key);
  final  Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: color??Colors.grey[200],

      leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.grey),onPressed: ()=>Navigator.pop(context),),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.grey),
          onPressed: () {},
        ),
        // const SizedBox(
        //   width: 10,
        // ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.grey),
          onPressed: () {},
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
