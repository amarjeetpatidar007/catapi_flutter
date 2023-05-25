import 'dart:convert';

import 'package:hive/hive.dart';

part 'cat_db_model.g.dart';

@HiveType(typeId: 0)
class CatHiveDBModel {
  @HiveField(0)
  String catId;
  @HiveField(1)
  String name;
  @HiveField(2)
  String imageId;
  @HiveField(3)
  String lifeSpan;
  @HiveField(4)
  String countryCode;
  CatHiveDBModel({
    required this.catId,
    required this.name,
    required this.imageId,
    required this.lifeSpan,
    required this.countryCode,
  });
 

  CatHiveDBModel copyWith({
    String? catId,
    String? name,
    String? imageId,
    String? lifeSpan,
    String? countryCode,
  }) {
    return CatHiveDBModel(
      catId: catId ?? this.catId,
      name: name ?? this.name,
      imageId: imageId ?? this.imageId,
      lifeSpan: lifeSpan ?? this.lifeSpan,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'catId': catId,
      'name': name,
      'imageId': imageId,
      'lifeSpan': lifeSpan,
      'countryCode': countryCode,
    };
  }

  factory CatHiveDBModel.fromMap(Map<String, dynamic> map) {
    return CatHiveDBModel(
      catId: map['catId'] ?? '',
      name: map['name'] ?? '',
      imageId: map['imageId'] ?? '',
      lifeSpan: map['lifeSpan'] ?? '',
      countryCode: map['countryCode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CatHiveDBModel.fromJson(String source) => CatHiveDBModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CatHiveDBModel(catId: $catId, name: $name, imageId: $imageId, lifeSpan: $lifeSpan, countryCode: $countryCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CatHiveDBModel &&
      other.catId == catId &&
      other.name == name &&
      other.imageId == imageId &&
      other.lifeSpan == lifeSpan &&
      other.countryCode == countryCode;
  }

  @override
  int get hashCode {
    return catId.hashCode ^
      name.hashCode ^
      imageId.hashCode ^
      lifeSpan.hashCode ^
      countryCode.hashCode;
  }
}
