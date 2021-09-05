import 'dart:convert';

PropertiesInCityImp propertiesInCityImpFromJson(String str) =>
    PropertiesInCityImp.fromJson(json.decode(str));
String propertiesInCityImpToJson(PropertiesInCityImp data) =>
    json.encode(data.toJson());

class PropertiesInCityImp {
  PropertiesInCityImp({
    this.properties,
  });

  List<PropertiesInCity> properties;

  PropertiesInCityImp.fromJson(Map<String, dynamic> json) {
    properties = List<PropertiesInCity>.from(
        json["properties"].map((x) => PropertiesInCity.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
        "properties": List<dynamic>.from(properties.map((x) => x.toJson())),
      };
}

class PropertiesInCity {
  PropertiesInCity({
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

  PropertiesInCity.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    featuredImage = json["featured_image"];
    createdBy = json["created_by"];
    shortDescription = json["short_description"];
    longDescription = json["long_description"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "featured_image": featuredImage,
        "created_by": createdBy,
        "short_description": shortDescription,
        "long_description": longDescription,
      };
}
