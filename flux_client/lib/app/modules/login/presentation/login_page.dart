import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flux_client/app/core/app_images.dart';
import 'package:flux_client/app/core/app_sizes.dart';
import 'package:flux_client/app/shared/widgets/input_widget.dart';
import 'package:flux_client/app/shared/widgets/primary_button_widget.dart';

import 'login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.s16),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(AppImages.logo),
                  SizedBox(
                    height: AppSizes.s16,
                  ),
                  InputWidget(
                    label: "Email",
                    controller: email,
                    type: 'email',
                  ),
                  SizedBox(
                    height: AppSizes.s16,
                  ),
                  InputWidget(
                    label: "Senha",
                    controller: senha,
                    type: 'normal',
                    isPassword: true,
                  ),
                  SizedBox(
                    height: AppSizes.s16,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: PrimaryButtonWidget(
                              onPress: () {}, text: "Login")),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
