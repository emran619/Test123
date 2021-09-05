import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:malkanat/widgets/inhomepagescreen/bottomnavigationbarwidget.dart';
import 'package:malkanat/widgets/inhomepagescreen/carouselwithads.dart';
import 'package:malkanat/widgets/inhomepagescreen/citiesnames.dart';
import 'package:malkanat/widgets/inhomepagescreen/citytypeswidget.dart';
import 'package:malkanat/widgets/inhomepagescreen/facilitynames.dart';
import 'package:malkanat/widgets/inhomepagescreen/facilitytypeswidget.dart';
import 'package:malkanat/widgets/inhomepagescreen/floatingactionbuttonwidget.dart';
import 'package:malkanat/widgets/mydrawer.dart';

class HomePageScreen extends StatefulWidget {
  static const routeName = 'homepage';
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffc59e51),
          title: Text(
            'Malkanat.co',
            style: TextStyle(color: Colors.black),
          ),
        ),
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
                child: Column(
                  children: [
                    CitiesNames(),
                    CarouselWithAds(),
                    FacilityNames(),
                    FacilityTypesWidget(),
                    CarTypesWidget(),
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
