import 'package:flutter/material.dart';
import 'package:malkanat/models/proporties_in_city_model.dart';
import 'package:malkanat/screens/proportyscreen.dart';
import 'package:malkanat/widgets/inhomepagescreen/bottomnavigationbarwidget.dart';
import 'package:malkanat/widgets/inhomepagescreen/citiesnames.dart';

import 'package:malkanat/widgets/inhomepagescreen/floatingactionbuttonwidget.dart';
import 'package:malkanat/widgets/mydrawer.dart';

class AllProporties extends StatefulWidget {
  static const routeName = 'allproporties';
  @override
  _AllProportiesState createState() => _AllProportiesState();
}

class _AllProportiesState extends State<AllProporties> {
  final List<PropertiesInCity> proporties = [
    PropertiesInCity(
      id: 1,
      title: 'فيلا',
      featuredImage: "img/test.jpg",
      createdBy: 23 - 2 - 12,
      shortDescription: 'فيلا بتجنن',
      longDescription: "فيها اطلالة عالجبل وحواليها كلو خضار وشي على عيني",
    ),
    PropertiesInCity(
      id: 2,
      title: 'بيت قديم',
      featuredImage: "img/test.jpg",
      createdBy: 23 - 2 - 12,
      shortDescription: 'بيت عالعضم مهرتك',
      longDescription: "ما بنصحك فيه ابدا لان كتير تعبان وخالص يعطيك العافية",
    ),
    PropertiesInCity(
      id: 3,
      title: 'مكتب',
      featuredImage: "img/test.jpg",
      createdBy: 23 - 2 - 12,
      shortDescription: 'مكتب بنص العاصمة',
      longDescription: "مكتب بإطلالة حلوة عالشام وديكور مرتب",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: MyDrawer(),
        appBar: AppBar(),
        body: DefaultTextStyle(
          style: Theme.of(context).textTheme.bodyText2,
          child: LayoutBuilder(builder:
              (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          CitiesNames(),
                          // Divider(
                          //   color: Colors.orange,
                          //   thickness: 4,
                          // ),
                          SizedBox(height: 5),
                          Expanded(
                            child: GridView.count(
                              scrollDirection: Axis.vertical,
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2/2,
                              children:proporties
                                  .map(
                                    (e) => GestureDetector(
                                      onTap:(){
                                        Navigator.of(context).pushNamed(ProPortyScreen.routeName);
                                        //هون بدي مرر معلومات العقار للصفحة تبع العقار
                                      },
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              image: new DecorationImage(
                                                image: ExactAssetImage(
                                                    'img/test.jpg'),
                                                fit: BoxFit.cover,
                                              ),
                                              color: Colors.blue,
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
                                                color:
                                                    Colors.black.withOpacity(0.4),
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(50),
                                                ),
                                              ),
                                              child: FittedBox(
                                                child: Text(e.shortDescription,
                                                    style: TextStyle(
                                                        color: Colors.white),
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
                        ],
                      ),
                    )
                  ],
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
