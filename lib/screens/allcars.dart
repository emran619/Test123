import 'package:flutter/material.dart';
import 'package:malkanat/models/car_list_model.dart';
import 'package:malkanat/screens/carscreen.dart';
import 'package:malkanat/widgets/inhomepagescreen/bottomnavigationbarwidget.dart';
import 'package:malkanat/widgets/inhomepagescreen/citytypeswidget.dart';
import 'package:malkanat/widgets/inhomepagescreen/floatingactionbuttonwidget.dart';
import 'package:malkanat/widgets/mydrawer.dart';

class AllCars extends StatefulWidget {
  static const routeName = 'allcars';
  @override
  _AllCarsState createState() => _AllCarsState();
}

class _AllCarsState extends State<AllCars> {
  final List<Cars> cars = [
    Cars(
      id: 1,
      title: 'small car',
      featuredImage: 'img/test.jpg',
      brand: 'LE12',
      model: 'BMW',
      shortDescription: 'WOW',
      longDescription: 'This is a great car baby',
    ),
    Cars(
      id: 2,
      title: 'big car',
      featuredImage: 'img/test.jpg',
      brand: 'RR14',
      model: 'TERTERAA',
      shortDescription: 'NOT-WOW',
      longDescription: 'This is a shity car baby',
    ),
    Cars(
      id: 3,
      title: 'Medum car',
      featuredImage: 'img/test.jpg',
      brand: 'LLL',
      model: 'Huenday',
      shortDescription: 'Super-WOW',
      longDescription: 'This is a Awosome car baby',
    ),
    Cars(
      id: 3,
      title: 'Medum car',
      featuredImage: 'img/test.jpg',
      brand: 'LLL',
      model: 'Huenday',
      shortDescription: 'Super-WOW',
      longDescription: 'This is a Awosome car baby',
    ),
    Cars(
      id: 3,
      title: 'Medum car',
      featuredImage: 'img/test.jpg',
      brand: 'LLL',
      model: 'Huenday',
      shortDescription: 'Super-WOW',
      longDescription: 'This is a Awosome car baby',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        endDrawer: MyDrawer(),
        body: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyText2,
          child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2 / 2,
                    children: cars
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(CarScreen.routeName);
                                  // هون بدي ابعت كل تفاصيل السيارة لأعرضن
                            },
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: new DecorationImage(
                                      image: ExactAssetImage(e.featuredImage),
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
                                      child: Text(e.model,
                                          style: TextStyle(color: Colors.white),
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  width: 200,
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            );
          }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButtonWidget(),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }
}
