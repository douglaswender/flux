import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/core/core.dart';
import 'package:flux_client/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:flux_client/app/shared/widgets/secondary_button/secondary_button_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        onTap: () => Modular.to.pop(),
        isBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: AppSizes.s42,
              ),
              Container(
                height: AppSizes.s128,
                width: AppSizes.s128,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://avatars.githubusercontent.com/u/13887472?v=4"))),
              ),
              SizedBox(
                height: AppSizes.s8,
              ),
              Text(
                "Douglas Wender",
                style: AppTextStyles.heading36,
              ),
              SizedBox(
                height: AppSizes.s24,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: SecondaryButtonWidget(
                                onPress: () {}, text: "Meu Perfil")),
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.s8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButtonWidget(
                              onPress: () => Modular.to.pushNamed('/order'),
                              text: "Minhas Encomendas"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.s8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SecondaryButtonWidget(
                              onPress: () => Modular.to.pushNamed('/config'),
                              text: "Configurações"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSizes.s8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
