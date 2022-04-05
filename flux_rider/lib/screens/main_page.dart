import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MaterialButton(
        onPressed: () {
          DatabaseReference ref = FirebaseDatabase.instance.ref().child('test');

          ref.set({'value': 'ok'});
        },
        child: const Text('Hello'),
      ),
    );
  }
}
