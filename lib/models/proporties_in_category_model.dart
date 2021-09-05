import 'dart:convert';

ProportiesInCategoryImp proportiesInCategoryImpFromJson(String str) =>
    ProportiesInCategoryImp.fromJson(json.decode(str));

String proportiesInCategoryImpToJson(ProportiesInCategoryImp data) =>
    json.encode(data.toJson());

class ProportiesInCategoryImp {
  ProportiesInCategoryImp({
    this.properties,
  });

  List<PropertiesInCategory> properties;

  ProportiesInCategoryImp.fromJson(Map<String, dynamic> json) {
    properties = List<PropertiesInCategory>.from(
        json["properties"].map((x) => PropertiesInCategory.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
        "properties": List<dynamic>.from(properties.map((x) => x.toJson())),
      };
}

class PropertiesInCategory {
  PropertiesInCategory({
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

  PropertiesInCategory.fromJson(Map<String, dynamic> json) {
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
