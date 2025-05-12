import 'package:flutter/material.dart';
import 'package:flutter_application_1/StartPage.dart';

class SignController {
  final TextEditingController searchController = TextEditingController();

  void onSearchSubmitted(String value) {
    print("検索キーワード: $value");
    // 検索処理をここに実装
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
