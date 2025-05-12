import 'package:flutter/material.dart';
import 'package:flutter_application_1/sign/Sign-design.dart';
import 'package:flutter_application_1/SettingPage.dart';

class Startpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("スタート画面"),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settingpage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 106, 110, 181),
          ),
          child: Text("スタート", style: TextStyle(color: Colors.white)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SignDesign()),
            );
          },
        ),
      ),
    );
  }
}
