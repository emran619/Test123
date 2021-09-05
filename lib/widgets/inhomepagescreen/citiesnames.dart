import 'package:flutter/material.dart';
import 'package:malkanat/constsarg.dart';

class CitiesNames extends StatefulWidget {
  @override
  _CitiesNamesState createState() => _CitiesNamesState();
}

class _CitiesNamesState extends State<CitiesNames> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 1,
          );
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              child: Chip(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 2.5),
                label: Text(
                  ConstsArg.cities[index],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffc59e51),
                  ),
                ),
                side: BorderSide(color: Color(0xffc59e51)),
              ),
              onTap: () {
                print(index);
              },
            ),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: ConstsArg.cities.length,
      ),
    );
  }
}
