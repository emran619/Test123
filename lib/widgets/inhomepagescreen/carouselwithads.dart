import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:malkanat/constsarg.dart';

class CarouselWithAds extends StatefulWidget {
  @override
  _CarouselWithAdsState createState() => _CarouselWithAdsState();
}

class _CarouselWithAdsState extends State<CarouselWithAds> {
  int _current = 0;

  final List<Widget> imageSliders = ConstsArg.colors.map((e) {
    return Container(
      width: 800,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: [
            Container(
              color: e,
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Center(child: Text('Adds')),
              ),
            ),
          ],
        ),
      ),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              //autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: ConstsArg.colors.map((c) {
          int index = ConstsArg.colors.indexOf(c);
          return Container(
            width: 8,
            height: 8,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index
                  ? Color(0xffc59e51)
                  : Color.fromRGBO(0, 0, 0, 0.3),
            ),
          );
        }).toList())
      ],
    );
  }
}
