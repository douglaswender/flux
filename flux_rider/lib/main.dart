import 'package:flutter/material.dart';
import 'package:flux_rider/screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flux',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'main',
      routes: {
        'main': (context) => const MainPage(),
      },
    );
  }
}
