import 'package:flutter/material.dart';
import 'sign_controller.dart';
import 'package:flutter_application_1/StartPage.dart';

class SignDesign extends StatefulWidget {
  @override
  _SignDesignState createState() => _SignDesignState();
}

class _SignDesignState extends State<SignDesign> {
  final SignController controller = SignController();
  List<Map<String, String>> imageData = [];

  void _handleSearch(String value) async {
    await controller.fetchImagesFromStrapi(value);
    setState(() {
      imageData = controller.getImageData();
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
                hintText: "例: あ い う",
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
              child: imageData.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageData.length,
                      itemBuilder: (context, index) {
                        final word = imageData[index]['word']!;
                        final url = imageData[index]['url']!;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Text(
                                word,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: 150,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    url,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
