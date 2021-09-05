import 'package:flutter/material.dart';
import 'package:malkanat/screens/allcars.dart';
import 'package:malkanat/screens/allproporties.dart';
import 'package:malkanat/screens/homepagescreen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xffc59e51),
            ),
            child: Center(
              child: Text(
                'Malkanat',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Center(
                  child:
                      Text('الصفحة الرئيسية', style: TextStyle(fontSize: 20))),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomePageScreen.routeName);
              },
            ),
          ),
          Divider(
            height: 15,
            thickness: 1,
            color: Color(0xffc59e51),
            indent: 110,
            endIndent: 110,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Center(
                  child: Text('كل العقارات', style: TextStyle(fontSize: 20))),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(AllProporties.routeName);
              },
            ),
          ),
          Divider(
            height: 15,
            thickness: 1,
            color: Color(0xffc59e51),
            indent: 110,
            endIndent: 110,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Center(
                  child: Text('كل السيارات', style: TextStyle(fontSize: 20))),
              onTap: () {
                Navigator.of(context).pushReplacementNamed(AllCars.routeName);
              },
            ),
          ),
          Divider(
            height: 15,
            thickness: 1,
            color: Color(0xffc59e51),
            indent: 110,
            endIndent: 110,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Center(
                  child: Text(
                'تسجيل الخروج',
                style: TextStyle(fontSize: 20),
              )),
              onTap: () {
                //
              },
            ),
          ),
        ],
      ),
    );
  }
}
