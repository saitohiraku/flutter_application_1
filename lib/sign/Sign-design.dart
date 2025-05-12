import 'package:flutter/material.dart';
import 'sign_controller.dart';
import 'package:flutter_application_1/StartPage.dart';

class SignDesign extends StatelessWidget {
  final SignController controller = SignController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("検索ページ")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.searchController,
              decoration: InputDecoration(
                hintText: "検索",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onSubmitted: controller.onSearchSubmitted,
            ),//検索バー
            SizedBox(height: 20),
            TextButton(
              child: Text("スタート画面に戻る"),
              onPressed: controller.navigateToStartPage(context),
            ),
          ],
        ),
      ),
    );
  }
}
