import 'package:flutter/material.dart';
import 'sign_controller.dart';
import 'package:flutter_application_1/StartPage.dart';

class SignDesign extends StatefulWidget {
  @override
  _SignDesignState createState() => _SignDesignState();
}

class _SignDesignState extends State<SignDesign> {
  final SignController controller = SignController();
  List<String> imageUrls = [];

  void _handleSearch(String value) async {
    await controller.fetchImagesFromStrapi(value);
    setState(() {
      imageUrls = controller.getImageUrls();
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
                hintText: "例: あ い う え お",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onSubmitted: _handleSearch,
            ),
            SizedBox(height: 20),
            TextButton(
              child: Text("スタート画面に戻る"),
              onPressed: controller.navigateToStartPage(context),
            ),
            SizedBox(height: 20),
            Expanded(
              child: imageUrls.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.network(imageUrls[index], height: 200),
                        );
                      },
                    )
                  : Text("画像がありません"),
            ),
          ],
        ),
      ),
    );
  }
}
