import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/categerious_model.dart';

class SearchWallpaper {
  Future<List<WallPaperModel>> getSearchWallpaper(String query) async {
    List<WallPaperModel> wallpapers = [];
    query.toLowerCase();
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=$query&per_page=50'),
        headers: {
          'Authorization':
              '563492ad6f91700001000001169bdf4741764090a1003ab6720ffa26'
        });
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData['photos'].forEach((element) {
      wallpapers.add(
        WallPaperModel(
          imageUrl: element['src']['portrait'] as String,
        ),
      );
    });
    return wallpapers;
  }
}