import 'package:flutter/material.dart';
import 'package:malkanat/screens/proportyscreen.dart';
import 'package:malkanat/widgets/inhomepagescreen/bottomnavigationbarwidget.dart';
import 'package:malkanat/widgets/inhomepagescreen/floatingactionbuttonwidget.dart';
import 'package:malkanat/widgets/mydrawer.dart';

class ProportiesInTapeScreen extends StatefulWidget {
  @override
  _ProportiesInTapeScreenState createState() => _ProportiesInTapeScreenState();
}

List<String> a = ['title', 'price', 'created at', 'ds', 's'];

class _ProportiesInTapeScreenState extends State<ProportiesInTapeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: MyDrawer(),
        appBar: AppBar(),
        body: Container(
          // color: Colors.red,
          child: ListView(
            children: a.map(
              (val) {
                return proportyWidget(context, val);
              },
            ).toList(),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButtonWidget(),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }
}

Widget proportyWidget(BuildContext context, dynamic val) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProPortyScreen.routeName);
          },
          child: Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              child: Row(
                children: [
                  Container(
                    height: 90,
                    width: 120,
                    margin: EdgeInsets.all(10),
                    child: Image.asset(
                      'img/test.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'tite of proporty',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        'Price',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        'Created At 2020-1-2',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Divider(thickness: 4, color: Color(0xffc59e51)),
    ],
  );
}

// Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 100,
//                     child: ListTile(
//                       leading: Container(
//                           //color: Colors.red,
//                           ),
//                       trailing: Text('2020-3-10'),
//                       subtitle: Text('Price'),
//                     ),
//                   ),
//                 );