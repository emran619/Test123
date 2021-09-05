import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:malkanat/screens/test.dart';

CitiesImp citiesImpFromJson(String str) => CitiesImp.fromJson(json.decode(str));

String citiesImpToJson(CitiesImp data) => json.encode(data.toJson());

class CitiesImp with ChangeNotifier{
  CitiesImp({
    this.cities,
  });

  List<Cities> cities = [];
  
  CitiesImp.fromJson(Map<String, dynamic> json) {
    cities = List<Cities>.from(json["cities"].map((x) => Cities.fromJson(x)));
    //print('\n&&&& From model ${cities.length}&&&&\n');
    notifyListeners();
    
  }

  Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

class Cities with ChangeNotifier{
  Cities({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  int id;
  String createdAt;
  String updatedAt;
  String name;

  Cities.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    name = json["name"];
    notifyListeners();
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,//.toIso8601String(),
        "updated_at": updatedAt,//.toIso8601String(),
        "name": name,
      };
}
