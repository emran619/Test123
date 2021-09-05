import 'dart:convert';

CarsImp carsImpFromJson(String str) =>
    CarsImp.fromJson(json.decode(str));

String carsImpToJson(CarsImp data) => json.encode(data.toJson());

class CarsImp {
  CarsImp({
    this.cars,
  });

  List<Cars> cars;

  CarsImp.fromJson(Map<String, dynamic> json) {
    cars = List<Cars>.from(json["cars"].map((x) => Cars.fromJson(x)));
  }
  Map<String, dynamic> toJson() => {
        "cars": List<dynamic>.from(cars.map((x) => x.toJson())),
      };
}

class Cars {
  Cars({
    this.id,
    this.title,
    this.featuredImage,
    this.brand,
    this.model,
    this.shortDescription,
    this.longDescription,
  });

  int id;
  String title;
  String featuredImage;
  String brand;
  String model;
  String shortDescription;
  String longDescription;

  Cars.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    featuredImage = json["featured_image"];
    brand = json["brand"];
    model = json["model"];
    shortDescription =
        json["short_description"] == null ? null : json["short_description"];
    longDescription = json["long_description"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "featured_image": featuredImage,
        "brand": brand,
        "model": model,
        "short_description": shortDescription == null ? null : shortDescription,
        "long_description": longDescription,
      };
}
