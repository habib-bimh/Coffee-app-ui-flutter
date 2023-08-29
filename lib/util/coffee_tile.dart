import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  //const CoffeeTile({Key? key}) : super(key: key);
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrince;
  CoffeeTile({required this.coffeeImagePath,required this.coffeeName,required this.coffeePrince});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0,bottom: 25),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black45
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //coffee image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
                child: Image.asset(coffeeImagePath)),
            //coffee name
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(coffeeName,style: TextStyle(fontSize: 20),),
                  SizedBox(height: 4),
                  Text("With Almond Milk",style: TextStyle(color: Colors.grey[700]),)
                ],
              ),
            ),
            //Price
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$'+coffeePrince),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                      borderRadius: BorderRadius.circular(6)
                    ),
                      child: Icon(Icons.add))
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
