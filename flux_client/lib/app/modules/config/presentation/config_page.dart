import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../core/core.dart';
import '../../../shared/widgets/app_bar/app_bar_widget.dart';
import '../../../shared/widgets/input/input_widget.dart';
import '../../../shared/widgets/primary_button/primary_button_widget.dart';
import '../../../shared/widgets/secondary_button/secondary_button_widget.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({Key? key}) : super(key: key);

  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        onTap: () => Modular.to.pop(),
        isBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.s32),
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
              InputWidget(label: "Nome completo"),
              SizedBox(
                height: AppSizes.s24,
              ),
              InputWidget(label: "CPF"),
              SizedBox(
                height: AppSizes.s24,
              ),
              InputWidget(label: "Email"),
              SizedBox(
                height: AppSizes.s24,
              ),
              Row(
                children: [
                  Expanded(
                      child: PrimaryButtonWidget(
                    text: 'Alterar Senha',
                    onPress: () {},
                  )),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppSizes.s32),
        child: Row(
          children: [
            Expanded(
              child: SecondaryButtonWidget(onPress: () {}, text: "Salvar"),
            ),
          ],
        ),
      ),
    );
  }
}
