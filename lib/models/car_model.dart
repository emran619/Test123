import 'dart:convert';

CarImp carImpFromJson(String str) => CarImp.fromJson(json.decode(str));

String carImpToJson(CarImp data) => json.encode(data.toJson());

class CarImp {
  CarImp({
    this.car,
  });
  Car car;

  CarImp.fromJson(Map<String, dynamic> json) {
    car = Car.fromJson(json["car"]);
  }

  Map<String, dynamic> toJson() => {
        "car": car.toJson(),
      };
}

class Car {
  Car({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.brand,
    this.model,
    this.colorId,
    this.fuelTypeId,
    this.productionDate,
    this.registrationDate,
    this.status,
    this.kilometresDriven,
    this.engineCapacity,
    this.fuelConsumption,
    this.acceleration,
    this.maxSpeed,
    this.cylindersNumber,
    this.emptyWeight,
    this.maxWeight,
    this.seatsId,
    this.doorsId,
    this.abs,
    this.ebs,
    this.hydraulicSteering,
    this.automaticGear,
    this.tireSize,
    this.wheelRimSize,
    this.ac,
    this.surroundSound,
    this.shortDescription,
    this.longDescription,
    this.featuredImage,
    this.images,
    this.views,
    this.approved,
    this.createdBy,
    this.hidden,
    this.carCategoryId,
    this.title,
    this.price,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String brand;
  String model;
  int colorId;
  int fuelTypeId;
  int productionDate;
  int registrationDate;
  int status;
  int kilometresDriven;
  int engineCapacity;
  int fuelConsumption;
  String acceleration;
  int maxSpeed;
  dynamic cylindersNumber;
  dynamic emptyWeight;
  dynamic maxWeight;
  dynamic seatsId;
  dynamic doorsId;
  int abs;
  int ebs;
  int hydraulicSteering;
  int automaticGear;
  dynamic tireSize;
  dynamic wheelRimSize;
  int ac;
  int surroundSound;
  String shortDescription;
  String longDescription;
  String featuredImage;
  List<String> images;
  int views;
  int approved;
  int createdBy;
  int hidden;
  int carCategoryId;
  String title;
  int price;

  Car.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);
    brand = json["brand"];
    model = json["model"];
    colorId = json["color_id"];
    fuelTypeId = json["fuel_type_id"];
    productionDate = json["production_date"];
    registrationDate = json["registration_date"];
    status = json["status"];
    kilometresDriven = json["kilometres_driven"];
    engineCapacity = json["engine_capacity"];
    fuelConsumption = json["fuel_consumption"];
    acceleration = json["acceleration"];
    maxSpeed = json["max_speed"];
    cylindersNumber = json["cylinders_number"];
    emptyWeight = json["empty_weight"];
    maxWeight = json["max_weight"];
    seatsId = json["seats_id"];
    doorsId = json["doors_id"];
    abs = json["abs"];
    ebs = json["ebs"];
    hydraulicSteering = json["hydraulic_steering"];
    automaticGear = json["automatic_gear"];
    tireSize = json["tire_size"];
    wheelRimSize = json["wheel_rim_size"];
    ac = json["ac"];
    surroundSound = json["surround_sound"];
    shortDescription = json["short_description"];
    longDescription = json["long_description"];
    featuredImage = json["featured_image"];
    images = List<String>.from(json["images"].map((x) => x));
    views = json["views"];
    approved = json["approved"];
    createdBy = json["created_by"];
    hidden = json["hidden"];
    carCategoryId = json["car_category_id"];
    title = json["title"];
    price = json["price"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "brand": brand,
        "model": model,
        "color_id": colorId,
        "fuel_type_id": fuelTypeId,
        "production_date": productionDate,
        "registration_date": registrationDate,
        "status": status,
        "kilometres_driven": kilometresDriven,
        "engine_capacity": engineCapacity,
        "fuel_consumption": fuelConsumption,
        "acceleration": acceleration,
        "max_speed": maxSpeed,
        "cylinders_number": cylindersNumber,
        "empty_weight": emptyWeight,
        "max_weight": maxWeight,
        "seats_id": seatsId,
        "doors_id": doorsId,
        "abs": abs,
        "ebs": ebs,
        "hydraulic_steering": hydraulicSteering,
        "automatic_gear": automaticGear,
        "tire_size": tireSize,
        "wheel_rim_size": wheelRimSize,
        "ac": ac,
        "surround_sound": surroundSound,
        "short_description": shortDescription,
        "long_description": longDescription,
        "featured_image": featuredImage,
        "images": List<dynamic>.from(images.map((x) => x)),
        "views": views,
        "approved": approved,
        "created_by": createdBy,
        "hidden": hidden,
        "car_category_id": carCategoryId,
        "title": title,
        "price": price,
      };
}
