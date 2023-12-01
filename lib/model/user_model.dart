// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

UserDetails userDetailsFromJson(String str) =>
    UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
  int? userId;
  int? id;
  String? title;
  String? body;

  UserDetails({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
