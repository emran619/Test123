import 'dart:convert';

AllPropertiesImp allPropertiesImpFromJson(String str) =>
    AllPropertiesImp.fromJson(json.decode(str));

String allPropertiesImpToJson(AllPropertiesImp data) =>
    json.encode(data.toJson());

class AllPropertiesImp {
  AllPropertiesImp({
    this.properties,
  });

  List<AllProperties> properties;

  AllPropertiesImp.fromJson(Map<String, dynamic> json) {
    properties = List<AllProperties>.from(
        json["properties"].map((x) => AllProperties.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
        "properties": List<dynamic>.from(properties.map((x) => x.toJson())),
      };
}

class AllProperties {
  AllProperties({
    this.id,
    this.title,
    this.featuredImage,
    this.shortDescription,
    this.longDescription,
  });

  int id;
  String title;
  String featuredImage;
  String shortDescription;
  String longDescription;

  AllProperties.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    featuredImage = json["featured_image"];
    shortDescription = json["short_description"];
    longDescription = json["long_description"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "featured_image": featuredImage,
        "short_description": shortDescription,
        "long_description": longDescription,
      };
}
