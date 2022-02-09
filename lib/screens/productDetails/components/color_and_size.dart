import 'package:flutter/material.dart';
class ColorAndSize extends StatelessWidget {
  const ColorAndSize({Key? key,this.size}) : super(key: key);
  final String? size;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            const Text('Color'),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 15,
              width: 60,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 15,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green),
                  ),
                  Container(
                    // height: 15,
                    width: 15,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue),
                  ),
                  Container(
                    width: 15,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red),
                  )
                ],
              ),
            )
          ],
        ),
        // Spacer(),
        Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            const Text("Size"),
            const SizedBox(height: 5,),
            Text(size??"")
          ],
        ),
        const SizedBox()
      ],
    );
  }
}
