import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/core/core.dart';
import 'package:flux_client/app/modules/home/presentation/widgets/map_widget/map_widget.dart';
import 'package:flux_client/app/modules/home/presentation/widgets/post_container/post_container.dart';
import 'package:flux_client/app/shared/widgets/app_bar/app_bar_widget.dart';
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
      appBar: AppBarDefault(
        onTap: () {
          Modular.to.pushNamed('/menu');
        },
      ),
      body: SafeArea(
        child: Observer(
          builder: (_) => Stack(
            children: [
              MapWidget(),
              DraggableScrollableSheet(
                maxChildSize: 0.7,
                initialChildSize: 0.7,
                minChildSize: 0.05,
                builder: (BuildContext context, ScrollController controller) {
                  return Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        )),
                    child: SingleChildScrollView(
                      controller: controller,
                      child: PostContainer(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
