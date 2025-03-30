import 'package:flutter/material.dart';
import 'package:goribli_studio/constants.dart';
import 'package:goribli_studio/utils/theme.dart';
import 'package:goribli_studio/view/about.dart';
import 'package:goribli_studio/view/home.dart';

void main() {
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
      },
    );
  }
}

