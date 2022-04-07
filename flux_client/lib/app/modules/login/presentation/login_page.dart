import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/core.dart';
import '../../../core/styles/app_images.dart';
import '../../../core/styles/app_sizes.dart';
import '../../../shared/widgets/default_circular_progress_indicator/default_circular_progress_indicator.dart';
import '../../../shared/widgets/input/input_widget.dart';
import '../../../shared/widgets/primary_button/primary_button_widget.dart';
import '../../../shared/widgets/secondary_button/secondary_button_widget.dart';

import 'login_store.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({
    Key? key,
    this.title = 'LoginPage',
  }) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    verifyUserLogged();
  }

  //TODO: Jogar essa função para o controller/store
  verifyUserLogged() async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    final String? password = prefs.getString('password');

    if (email!.isNotEmpty && password!.isNotEmpty) {
      store.login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(AppSizes.s16),
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom,
          width: MediaQuery.of(context).size.width,
          child: Observer(
            builder: (_) => Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        AppImages.logo,
                        height: AppSizes.s128,
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.s16,
                    ),
                    InputWidget(
                      label: "Email",
                      controller: email,
                      onChange: (email) {
                        store.email = email;
                      },
                      type: 'email',
                    ),
                    SizedBox(
                      height: AppSizes.s16,
                    ),
                    InputWidget(
                      label: "Senha",
                      controller: password,
                      type: 'normal',
                      isPassword: true,
                    ),
                    SizedBox(
                      height: AppSizes.s16,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                child: PrimaryButtonWidget(
                                    onPress: () {
                                      store.email = email.text;
                                      store.password = password.text;
                                      store.login();
                                    },
                                    text: "Login")),
                          ],
                        ),
                        // SizedBox(
                        //   height: AppSizes.s16,
                        // ),
                        // Row(
                        //   mainAxisSize: MainAxisSize.max,
                        //   children: [
                        //     Expanded(
                        //         child: SocialButton(
                        //             onPress: () {
                        //               store.email = email.text;
                        //               store.password = password.text;
                        //               store.loginWithGoogle();
                        //             },
                        //             text: "Entrar com o Google")),
                        //   ],
                        // ),
                        SizedBox(
                          height: AppSizes.s16,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: SecondaryButtonWidget(
                                  onPress: () {
                                    Modular.to.pushNamed('/register');
                                  },
                                  text: "Cadastre-se"),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                if (store.loading)
                  Align(
                    child: DefaultProgressIndicator(),
                    alignment: Alignment.topRight,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
