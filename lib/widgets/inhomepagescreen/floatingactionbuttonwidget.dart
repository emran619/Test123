import 'package:flutter/material.dart';
import 'package:malkanat/screens/carscreen.dart';
import 'package:malkanat/screens/proportyscreen.dart';

class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  _FloatingActionButtonWidgetState createState() =>
      _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState
    extends State<FloatingActionButtonWidget> {
  Future<void> openDiaog() async {
    switch (await showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return SimpleDialog(
          title: Center(child: Text('Add New Car/Porproty')),
          children: <Widget>[
            SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pushNamed(ProPortyScreen.routeName);
                },
                child: Center(
                  child: Text('ProPorty'),
                )),
            SimpleDialogOption(
                onPressed: () {
                  Navigator.of(context).pushNamed(CarScreen.routeName);
                },
                child: Center(
                  child: Text('Car'),
                )),
          ],
        );
      },
    )) {
      case ProPortyScreen.routeName:
        print('proporty');
        break;
      case CarScreen.routeName:
        print('car');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xffc59e51),
      onPressed: openDiaog,
      child: Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
