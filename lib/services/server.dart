import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Server {
  final String url = "http://localhost:3000";

  static Image fetchImage(String id, int index) {
    //final uri = Uri.http('localhost:3000', '/image', {name: name});
    Uri imageUri = Uri.parse('http://192.168.1.22:3000/image/$id/$index');
    return Image(
      image: NetworkImage(imageUri.toString()),
      fit: BoxFit.fill,
    );
  }

  static Future<List<Image>> fetchImages(String id, int imageCount) async {
    //final uri = Uri.http('localhost:3000', '/image', {name: name});
    List<Image> imageList = [];
    for (int index = 0; index < imageCount; index++) {
      Uri imageUri = Uri.parse('http://192.168.1.22:3000/image/$id/$index');
      imageList.add(Image.network(
        imageUri.toString(),
        fit: BoxFit.fill,
      ));
    }
    return imageList;
  }

  static Future<List> fetchUserData() async {
    final response = await http.get(Uri.parse("http://192.168.1.22:3000/"));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse;
    } else {
      throw Exception('Failed to fetch users from API');
    }
  }
}
