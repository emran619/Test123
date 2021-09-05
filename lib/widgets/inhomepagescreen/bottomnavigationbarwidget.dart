import 'package:flutter/material.dart';
import 'package:malkanat/screens/allcars.dart';
import 'package:malkanat/screens/allproporties.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AllCars.routeName);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.car_rental, color: Color(0xffc59e51)),
                Text(
                  'All Cars',
                  style: TextStyle(
                    color: Color(0xffc59e51),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AllProporties.routeName);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.business,
                  color: Color(0xffc59e51),
                ),
                Text(
                  'All Proporties',
                  style: TextStyle(
                    color: Color(0xffc59e51),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
