import 'package:flutter/material.dart';
import 'package:malkanat/constsarg.dart';

class CarTypesWidget extends StatelessWidget {
  const CarTypesWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Divider(
            color: Colors.orange,
            thickness: 4,
          ),
          SizedBox(height: 5),
          Expanded(
            child: GridView.count(
              scrollDirection: Axis.horizontal,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 10,
              childAspectRatio: 0.5,
              children: ConstsArg.grides
                  .map(
                    (e) => Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: new DecorationImage(
                              image: ExactAssetImage('img/test.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 15,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(50),
                              ),
                            ),
                            child: FittedBox(
                              child: Text("Hi There",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center),
                            ),
                          ),
                          width: 200,
                          height: 15,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
