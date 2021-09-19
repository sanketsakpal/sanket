// To parse this JSON data, do
//
//     final categoryName = categoryNameFromJson(jsonString);

import 'dart:convert';

List<CategoryName> categoryNameFromJson(String str) => List<CategoryName>.from(
    json.decode(str).map((x) => CategoryName.fromJson(x)));

String categoryNameToJson(List<CategoryName> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryName {
  CategoryName({
    this.id,
    required this.catName,
  });

  String? id;
  String catName;

  factory CategoryName.fromJson(Map<String, dynamic> json) => CategoryName(
        id: json["id"],
        catName: json["cat_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat_name": catName,
      };
}
