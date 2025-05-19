import 'package:flutter/material.dart';
import 'package:flutter_application_1/StartPage.dart';
import '../test/sign-test.dart';

class SignController {
  final TextEditingController searchController = TextEditingController();
  String? imageUrl;

  void onSearchSubmitted(String value) {
    print("検索キーワード: $value");
    imageUrl = signImageMap[value]; // 対応する画像を辞書から取得
    // 検索処理をここに実装
  }

  String? getImageUrl() {
    return imageUrl;
  }

  VoidCallback navigateToStartPage(BuildContext context) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Startpage()),
      );
    };
  }
}
