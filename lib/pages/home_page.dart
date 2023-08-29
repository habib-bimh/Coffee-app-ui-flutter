import 'package:coffee_app_ui/util/coffee_tile.dart';
import 'package:coffee_app_ui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //list of coffee types
  final List coffeeType =[
    //[ coffee type, isSeleted ]
    ['Coppucino', true,],
    ['Latte', false,],
    ['Black',false,],
    ['Tea',false],
  ];

  //user tapped on coffee types
  void coffeeTypeSeleted(int index){
    setState(() {
      //this for loop makes every seleted false
      for (int i=0; i< coffeeType.length; i++){
        coffeeType[i][1] = false;
      }
      coffeeType[index][1]= true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false, // set it to false
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.menu),
          actions: [
            Padding(padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.person),
            ),

          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon:Icon(Icons.home),
              label: ""
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.favorite),
                label: ""
            ),
            BottomNavigationBarItem(
                icon:Icon(Icons.notifications),
                label: ""
            )
          ],
        ),
        body: Column(
          children: [
           //Find the best coffee for you
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text("Find the best coffee for you",style: GoogleFonts.bebasNeue(fontSize: 58.0),),
            ),
            SizedBox(height: 25,),
           //Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,),
                  hintText: "Find your coffee",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)
                  )
                ),
              ),
            ),
            SizedBox(height:25),

           //horizontal Listview of coffee types
           Container(
             height: 50,
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: coffeeType.length,
                 itemBuilder: (context, index){
               return CoffeeType(coffeeType: coffeeType[index][0],
                   isSelected: coffeeType[index][1],
                   onTap: (){
                     coffeeTypeSeleted(index);
                   },);
             }
               
             ),
           ),
           //horizontal listview of coffee tiles
            Expanded(child: ListView(
              scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeeImagePath: 'assets/images/coffee1.png',
                coffeeName: "Latte",
                coffeePrince: "4.20",
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/images/coffee4.jpg',
                coffeeName: "Cappucino",
                coffeePrince: "4.00",
              ),
              CoffeeTile(
                coffeeImagePath: 'assets/images/coffee3.jpg',
                coffeeName: "Milk Coffee thing",
                coffeePrince: '4.60',
              ),
            ],
            ))

          ],
        )
      ),
    );
  }
}
