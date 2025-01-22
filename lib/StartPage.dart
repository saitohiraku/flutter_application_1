import 'package:flutter/material.dart';
import 'package:flutter_application_1/BeginPage.dart';
import 'package:flutter_application_1/SettingPage.dart';

class Startpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("スタート画面"),
          actions: [
          // 右上の設定ボタン
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // 設定ページへの遷移処理
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settingpage(), // 設定画面
                ),
              );
            },
          ),
        ],
      ),
      body : Center(
        child: TextButton(
          style:TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 106, 110, 181),
        ),
          child: Text("スタート"),
          // （1） 前の画面に戻る
          onPressed: (){
            // （1） 指定した画面に遷移する
            Navigator.pushReplacement(context, MaterialPageRoute(
              // （2） 実際に表示するページ(ウィジェット)を指定する
              builder: (context) => BeginPage()
            ));
          },
        ),
      ),
      
    );
  }
}