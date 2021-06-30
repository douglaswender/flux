import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/modules/home/presentation/widgets/map_widget.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flux'),
      ),
      body: Stack(
        children: [
          // Observer(
          //   builder: (context) => ,
          // ),
          MapSample(),
        ],
      ),
    );
  }
}
