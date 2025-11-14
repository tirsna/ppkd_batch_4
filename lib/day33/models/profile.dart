// To parse this JSON data, do
//
//     final profilemodels = profilemodelsFromJson(jsonString);

import 'dart:convert';
import 'package:ppkd_batch_4/day33/models/register.dart';

Profilemodels profilemodelsFromJson(String str) =>
    Profilemodels.fromJson(json.decode(str));

String profilemodelsToJson(Profilemodels data) => json.encode(data.toJson());

class Profilemodels {
  String? message;
  User? data;

  Profilemodels({this.message, this.data});

  factory Profilemodels.fromJson(Map<String, dynamic> json) => Profilemodels(
    message: json["message"],
    data: json["data"] == null ? null : User.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {"message": message, "data": data?.toJson()};
}

class Data {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
