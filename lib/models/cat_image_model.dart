

import 'dart:convert';

List<CatImageModel> catImageModelFromJson(String str) =>
    List<CatImageModel>.from(
        json.decode(str).map((x) => CatImageModel.fromJson(x)));

String catImageModelToJson(List<CatImageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CatImageModel {
  String id;
  String url;
  int width;
  int height;

  CatImageModel({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory CatImageModel.fromJson(Map<String, dynamic> json) => CatImageModel(
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "width": width,
        "height": height,
      };
}
