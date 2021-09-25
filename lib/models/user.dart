import 'package:flutter/material.dart';
import 'package:medical_portal/services/server.dart';

class User {
  final String id;
  final String name;
  final String contact;
  final int imageCount;

  User({this.id, this.contact, this.name, this.imageCount});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        //image: json['image'] != null ? json['image'] : null ,
        id: json['_id'],
        contact: json['contact'],
        name: json['name'],
        imageCount: json['imageCount']);
  }

  Image fetchImage(int index) {
    return Server.fetchImage(this.id, index);
  }

  Future<List<Image>> fetchImages() async {
    return Server.fetchImages(this.id, this.imageCount);
  }

  // Future<String> getJsonData() async {
  //   final response = await http.get(
  //     Uri.parse(Uri.encodeFull(url)),
  //     //headers: {"Accept": "application/json"}
  //   );
  //   print(response.body);
  // }

  static Future<List<User>> fetchUsers() async {
    List jsonData = await Server.fetchUserData();
    return jsonData.map((user) => User.fromJson(user)).toList();
  }
}
