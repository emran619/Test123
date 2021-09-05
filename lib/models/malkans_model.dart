import 'dart:convert';

MalkansImp malkansImpFromJson(String str) =>
    MalkansImp.fromJson(json.decode(str));

String malkansImpToJson(MalkansImp data) => json.encode(data.toJson());

class MalkansImp {
  MalkansImp({
    this.malkans,
    this.cars,
  });

  List<Malkan> malkans;
  List<Car> cars;

  MalkansImp.fromJson(Map<String, dynamic> json) {
    malkans = List<Malkan>.from(json["malkans"].map((x) => Malkan.fromJson(x)));
    cars = List<Car>.from(json["cars"].map((x) => Car.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
        "malkans": List<dynamic>.from(malkans.map((x) => x.toJson())),
        "cars": List<dynamic>.from(cars.map((x) => x.toJson())),
      };
}

class Car {
  Car({
    this.id,
    this.title,
    this.brand,
    this.model,
    this.shortDescription,
    this.longDescription,
  });

  int id;
  String title;
  String brand;
  String model;
  String shortDescription;
  String longDescription;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        id: json["id"],
        title: json["title"],
        brand: json["brand"],
        model: json["model"],
        shortDescription: json["short_description"],
        longDescription: json["long_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "brand": brand,
        "model": model,
        "short_description": shortDescription,
        "long_description": longDescription,
      };
}

class Malkan {
  Malkan({
    this.id,
    this.title,
    this.featuredImage,
    this.createdBy,
    this.shortDescription,
    this.longDescription,
  });

  int id;
  String title;
  String featuredImage;
  int createdBy;
  String shortDescription;
  String longDescription;

  factory Malkan.fromJson(Map<String, dynamic> json) => Malkan(
        id: json["id"],
        title: json["title"],
        featuredImage: json["featured_image"],
        createdBy: json["created_by"],
        shortDescription: json["short_description"],
        longDescription: json["long_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "featured_image": featuredImage,
        "created_by": createdBy,
        "short_description": shortDescription,
        "long_description": longDescription,
      };
}
