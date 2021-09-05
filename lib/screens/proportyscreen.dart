import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:malkanat/widgets/callingfloationgactionbuttonwidget.dart';
import 'package:malkanat/widgets/inhomepagescreen/bottomnavigationbarwidget.dart';
import 'package:malkanat/widgets/mydrawer.dart';

List<Object> imgList = [
  'img/test.jpg',
  'img/test.jpg',
  'img/test.jpg',
  'img/test.jpg',
  'img/test.jpg',
  'img/test.jpg',
];

final List<Widget> tt = imgList.map((data) {
  var i = imgList.indexOf(data);
  return Builder(
    builder: (BuildContext context) {
      return Wrap(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 350,
            margin: EdgeInsets.symmetric(
              horizontal: 1.0, 
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Image(
                image: new AssetImage(imgList[i]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          
        ],
      );
    },
  );
}).toList();

class ProPortyScreen extends StatefulWidget {
  static const routeName = 'proportyscreen';
  @override
  State<StatefulWidget> createState() {
    return _ProPortyScreenState();
  }
}

class _ProPortyScreenState extends State<ProPortyScreen> {
  // int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MyDrawer(),
      appBar: AppBar(title: Text('صفحة العقار')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 350,
                enlargeCenterPage: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  // setState(() {
                  //   _current = index;
                  
                  // });
                },
              ),
              items: tt,
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: imgList.map(
          //     (c) {
          //       int index = imgList.indexOf(c);
          //       return Container(
          //         width: 8,
          //         height: 8,
          //         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: _current == index
          //               ? Color(0xffc59e51)
          //               : Color.fromRGBO(0, 0, 0, 0.3),
          //         ),
          //       );
          //     },
          //   ).toList(),
          // ),
          SizedBox(height:5,),
          Text(
            'Title of Proporty',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          
          Text(
            'Price',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          
          Text(
            ' ف يبليب  يبليب سبصث صثب صثثصب صثب صثب صث صثب صثبصثصصص ص ثبب صثب',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 15,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CallingFloatingActionButtonWidget(),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
