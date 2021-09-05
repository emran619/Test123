import 'package:flutter/material.dart';
import 'package:malkanat/screens/carscreen.dart';
import 'package:malkanat/screens/proportyscreen.dart';

class CallingFloatingActionButtonWidget extends StatefulWidget {
  const CallingFloatingActionButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  _CallingFloatingActionButtonWidgetState createState() =>
      _CallingFloatingActionButtonWidgetState();
}

class _CallingFloatingActionButtonWidgetState
    extends State<CallingFloatingActionButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xffc59e51),
      onPressed: () {
        print('call');
      },
      child: Center(
        child: Icon(
          Icons.call,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
