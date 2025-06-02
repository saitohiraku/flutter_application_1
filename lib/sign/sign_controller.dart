// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/StartPage.dart';
// import '../test/sign-test.dart';

// class SignController {
//   final TextEditingController searchController = TextEditingController();
//   String? imageUrl;

//   void onSearchSubmitted(String value) {
//     print("検索キーワード: $value");
//     imageUrl = signImageMap[value]; // 対応する画像を辞書から取得
//     // 検索処理をここに実装
//   }

//   String? getImageUrl() {
//     return imageUrl;
//   }

//   VoidCallback navigateToStartPage(BuildContext context) {
//     return () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => Startpage()),
//       );
//     };
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../StartPage.dart';

class SignController {
  final TextEditingController searchController = TextEditingController();
  String? imageUrl;

  Future<void> fetchImageFromStrapi(String keyword) async {
    final uri = Uri.parse(
        'http://localhost:1337/api/signs?filters[SignSearch][\$eq]=$keyword');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['data'].isNotEmpty) {
          final imagePath = data['data'][0]['SignUrl'];
          imageUrl = imagePath.startsWith('http')
              ? imagePath
              : 'http://localhost:1337$imagePath';
        } else {
          imageUrl = null;
        }
      } else {
        imageUrl = null;
        print('Strapi APIエラー: ${response.statusCode}');
      }
    } catch (e) {
      imageUrl = null;
      print('通信エラー: $e');
    }
  }

  String? getImageUrl() => imageUrl;

  VoidCallback navigateToStartPage(BuildContext context) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Startpage()),
      );
    };
  }
}
