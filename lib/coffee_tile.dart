import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeImagePath;
  final String coffeName;
  final String coffePrice;

  CoffeeTile(
      {required this.coffeImagePath,
      required this.coffeName,
      required this.coffePrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 20),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //coffee image
            ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  coffeImagePath,
                  width: 200,
                  height: 190,
                  fit: BoxFit.cover,
                )),
            //coffee name and description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeName,
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'With Almond Milk',
                    style: TextStyle(color: Colors.grey[700]),
                  )
                ],
              ),
            ),
            //coffee prices
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(coffePrice),
                  Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(6)),
                      child: Icon(Icons.add))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
