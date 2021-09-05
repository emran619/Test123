import 'package:flutter/material.dart';
import 'package:malkanat/constsarg.dart';

class FacilityNames extends StatefulWidget {
  @override
  _FacilityNamesState createState() => _FacilityNamesState();
}

class _FacilityNamesState extends State<FacilityNames> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
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
                  ConstsArg.facility[index],
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
        itemCount: ConstsArg.facility.length,
      ),
    );
  }
}
