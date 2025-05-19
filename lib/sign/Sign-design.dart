import 'package:flutter/material.dart';
import 'sign_controller.dart';
import 'package:flutter_application_1/StartPage.dart';

class SignDesign extends StatefulWidget {
  @override
  _SignDesignState createState() => _SignDesignState();
}

class _SignDesignState extends State<SignDesign> {
  final SignController controller = SignController();
  String? imageUrl;

  void _handleSearch(String value) {
    controller.onSearchSubmitted(value);
    setState(() {
      imageUrl = controller.getImageUrl();
    });
  }

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
              onSubmitted: _handleSearch,
            ),
            //検索バー
            SizedBox(height: 20),
            TextButton(
              child: Text("スタート画面に戻る"),
              onPressed: controller.navigateToStartPage(context),
            ),
            SizedBox(height: 20),
            if (imageUrl != null)
              Image.network(
                imageUrl!,
                width: 200,
                height: 200,
              )
            else
              Text("画像がありません"),
          ],
        ),
      ),
    );
  }
}
