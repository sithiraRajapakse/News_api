import 'package:flutter/material.dart';
import 'package:sithira_newsapp/common/constants.dart';
import 'package:sithira_newsapp/pages/home_page.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: blue,
          centerTitle: true,
          foregroundColor: appBarWhite,
        ),
      ),
      home: HomePage(),
    );
  }
}
