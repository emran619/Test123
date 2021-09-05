import 'dart:convert';

CategoriesImp categoryListImpFromJson(String str) =>
    CategoriesImp.fromJson(json.decode(str));

String categoryListImpToJson(CategoriesImp data) => json.encode(data.toJson());

class CategoriesImp {
  CategoriesImp({
    this.categories,
  });

  List<Categories> categories;

  CategoriesImp.fromJson(Map<String, dynamic> json) {
    categories = List<Categories>.from(
        json["categories"].map((x) => Categories.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Categories {
  Categories({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  String name;

  Categories.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    createdAt = DateTime.parse(json["created_at"]);
    updatedAt = DateTime.parse(json["updated_at"]);
    name = json["name"];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
      };
}
