import 'package:flutter/material.dart';
import 'package:goribli_studio/constants.dart';
import 'package:goribli_studio/utils/theme.dart';
import 'package:goribli_studio/view/about.dart';
import 'package:goribli_studio/view/download.dart';
import 'package:goribli_studio/view/home.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async{
  setUrlStrategy(PathUrlStrategy());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: app_name,
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/about': (context) => const About(),
        '/download': (context) => const Download(),
      },
    );
  }
}

