import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:malkanat/models/city_list_model.dart';

import 'package:malkanat/network/dio_helper.dart';
import 'package:malkanat/network/local_host.dart';
import 'package:malkanat/screens/allcars.dart';
import 'package:malkanat/screens/allproporties.dart';
import 'package:malkanat/screens/authscreen.dart';

import 'package:malkanat/screens/carscreen.dart';
import 'package:malkanat/screens/homepagescreen.dart';


import 'package:malkanat/screens/proportyscreen.dart';
import 'package:malkanat/screens/test.dart';
import 'package:provider/provider.dart';


void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();

  bool onBoarding = CachHelper.getData(key: 'onBoarding');
  String token = CachHelper.getData(key: 'token');

  DioHelper.init();
  runApp(MyApp(token));
}

class MyApp extends StatelessWidget {
  String token;
  MyApp(this.token);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CitiesImp>(create: (_) => CitiesImp()),
        Provider<Cities>(create: (_) => Cities()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Malkanat App',
          theme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: AppBarTheme(
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark),
              backgroundColor: Colors.orange[600],
            ),
          ),
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            /* dark theme settings */
          ),
          home:
              Testt(), //token != null ?HomePageScreen() : AuthScreen(),
          routes: {
            'homepage': (BuildContext context) => HomePageScreen(),
            'AuthScreen': (BuildContext context) => AuthScreen(),
            'proportyscreen': (BuildContext context) => ProPortyScreen(),
            'carScreen': (BuildContext context) => CarScreen(),
            'allproporties': (BuildContext context) => AllProporties(),
            'allcars': (BuildContext context) => AllCars(),
          }),
    );
  }
}
