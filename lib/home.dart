import 'package:coffee_app/coffee_tile.dart';
import 'package:coffee_app/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  static const String RouteName = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //list of coffee types
  final List coffeeType = [
    //coffee type,isSelected
    [
      'cappucino',
      true,
    ],
    [
      'latte',
      false,
    ],
    [
      'ice coffe',
      false,
    ],
    [
      'americano',
      false,
    ],
    [
      'matcha',
      false,
    ],
  ];

  // user tapped coffe type
  void coffeeTypeSelected(int index) {
    // this for make all selection false
    for (int i = 0; i < coffeeType.length; i++) {
      coffeeType[i][1] = false;
    }
    setState(() {
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(Icons.person),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 28,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 28,
              ),
              label: ''),
        ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Find the best coffe for you',
                style: GoogleFonts.bebasNeue(fontSize: 56),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Find your cofee',
                    prefixIcon: Icon(Icons.search),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600))),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              child: ListView.builder(
                itemCount: coffeeType.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return CoffeeType(
                      coffeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: () {
                        coffeeTypeSelected(index);
                      });
                },
              ),
            ),
            Expanded(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                    coffeImagePath:
                        'https://th.bing.com/th/id/OIP.G59Ug0a6TS1nA2Y-gO-n5gHaE9?pid=ImgDet&rs=1',
                    coffeName: 'cappucino',
                    coffePrice: '50'),
                CoffeeTile(
                    coffeImagePath:
                        'https://th.bing.com/th/id/R.f4b687d495e103e2a4241938e2a5151c?rik=A1mlPtcLreSJaQ&pid=ImgRaw&r=0',
                    coffeName: 'latte',
                    coffePrice: '44'),
                CoffeeTile(
                    coffeImagePath:
                        'https://img.freepik.com/free-photo/iced-latte-coffee-morning-breakfast-concept_144627-42796.jpg?'
                        'w=360&t=st=1671127833~exp=1671128433~hmac=84072def55a443b162df52112f083912d6a0531a4dbc669f3d2cd742bbf2a193',
                    coffeName: 'ice cofee',
                    coffePrice: '45'),
                CoffeeTile(
                    coffeImagePath:
                        'https://www.coffeecityusa.com/wp-content/uploads/2018/01/3-americano-768x768.jpg',
                    coffeName: 'americano',
                    coffePrice: '40'),
                CoffeeTile(
                    coffeImagePath:
                        'https://th.bing.com/th/id/R.26251fddfdbbd10a92f93ba3708b4918?rik=9ElBQUP7nPuQhw&pid=ImgRaw&r=0',
                    coffeName: 'matcha',
                    coffePrice: '60'),
              ],
            ))
          ],
        ));
  }
}
