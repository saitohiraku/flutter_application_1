import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../StartPage.dart';

class SignController {
  final TextEditingController searchController = TextEditingController();
  final List<String> imageUrls = [];

  Future<void> fetchImagesFromStrapi(String input) async {
    imageUrls.clear();

    final keywords = input.trim().split(RegExp(r'\s+'));

    for (final keyword in keywords) {
      final uri = Uri.parse(
        'http://localhost:1337/api/signs?filters[SignSearch][\$eq]=$keyword',
      );

      try {
        final response = await http.get(uri);
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          if (data['data'].isNotEmpty) {
            final imagePath = data['data'][0]['SignUrl'];
            final imageUrl = imagePath.startsWith('http')
                ? imagePath
                : 'http://localhost:1337$imagePath';

            imageUrls.add(imageUrl);
          }
        }
      } catch (e) {
        print('検索失敗: $e');
      }
    }
  }

  List<String> getImageUrls() => imageUrls;

  VoidCallback navigateToStartPage(BuildContext context) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Startpage()),
      );
    };
  }
}
