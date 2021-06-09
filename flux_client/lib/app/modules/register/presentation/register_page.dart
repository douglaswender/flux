import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flux_client/app/core/core.dart';
import 'package:flux_client/app/core/styles/app_keyboards.dart';
import 'package:flux_client/app/modules/register/presentation/register_store.dart';
import 'package:flux_client/app/shared/widgets/input_widget.dart';
import 'package:flux_client/app/shared/widgets/primary_button_widget.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = 'RegisterPage'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final RegisterStore store = Modular.get();

  GlobalKey safeAreaKey = GlobalKey();

  double safeAreaHeight = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        key: safeAreaKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(AppSizes.s16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  AppImages.logo,
                  height: 100,
                ),
                SizedBox(
                  height: AppSizes.s16,
                ),
                InputWidget(
                  label: "Email",
                  onChange: (email) {
                    store.email = email;
                    print(store.email);
                  },
                  type: AppKeyboards.email,
                ),
                SizedBox(
                  height: AppSizes.s16,
                ),
                InputWidget(
                  isCapitalization: true,
                  label: "Nome",
                  onChange: (name) {
                    store.name = name;
                    print(store.name);
                  },
                  type: AppKeyboards.normal,
                ),
                SizedBox(
                  height: AppSizes.s16,
                ),
                InputWidget(
                  label: "Senha",
                  onChange: (password) {
                    store.password = password;
                    print(store.password);
                  },
                  type: AppKeyboards.normal,
                  isPassword: true,
                ),
                SizedBox(
                  height: AppSizes.s16,
                ),
                InputWidget(
                  label: "Confirmar senha",
                  onChange: (confirmPassword) {
                    store.confirmPassword = confirmPassword;
                    print(store.confirmPassword);
                  },
                  type: AppKeyboards.normal,
                  isPassword: true,
                ),
                SizedBox(
                  height: AppSizes.s16,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Observer(
                      builder: (_) {
                        if (store.fieldsNotNull) {
                          return Expanded(
                            child: PrimaryButtonWidget(
                              onPress: () {
                                print(store.fieldsNotNull);
                                store.register();
                              },
                              text: "Registre-se",
                            ),
                          );
                        } else {
                          return Expanded(
                            child: PrimaryButtonWidget(
                              text: "Registre-se",
                            ),
                          );
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
