import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:newbie/data/photo.dart';

/// Add http library: flutter pub add http
class AppRepository {
  static const baseUrl = "https://jsonplaceholder.typicode.com/photos";

// A function that converts a response body into a List<Photo>.
  List<Photo> parsePhotos(String responseBody) {
    final parsed =
    (jsonDecode(responseBody) as List).cast<Map<String, dynamic>>();

    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  Future<List<Photo>> fetchPhotos(Client client) async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    // Synchronously run parsePhotos in the main isolate.
    return compute(parsePhotos, response.body);
  }
}