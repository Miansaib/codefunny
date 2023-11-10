// To parse this JSON data, do
//
//     final contentModel = contentModelFromJson(jsonString);

import 'dart:convert';

List<ContentModel> contentModelFromJson(String str) => List<ContentModel>.from(json.decode(str).map((x) => ContentModel.fromJson(x)));

String contentModelToJson(List<ContentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ContentModel {
  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;
  final int? courseId;
  final String? description;

  ContentModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.courseId,
    this.description,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) => ContentModel(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    name: json["name"],
    courseId: json["course_id"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "name": name,
    "course_id": courseId,
    "description": description,
  };
}
