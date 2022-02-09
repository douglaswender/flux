import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import '../../../core/core.dart';
import '../../../core/styles/app_keyboards.dart';
import 'register_store.dart';
import '../../../shared/widgets/default_circular_progress_indicator/default_circular_progress_indicator.dart';
import '../../../shared/widgets/input/input_widget.dart';
import '../../../shared/widgets/primary_button/primary_button_widget.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = 'RegisterPage'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final RegisterStore store = Modular.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppImages.logoLine,
          height: 50,
        ),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(AppSizes.s16),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: AppSizes.s16,
                      ),
                      InputWidget(
                        label: "Email",
                        textInputAction: TextInputAction.next,
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
                        textInputAction: TextInputAction.next,
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
                        textInputAction: TextInputAction.next,
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
                      // Row(
                      //   mainAxisSize: MainAxisSize.max,
                      //   children: [
                      //     Observer(
                      //       builder: (_) {
                      //         if (store.fieldsNotNull) {
                      //           return Expanded(
                      //             child: PrimaryButtonWidget(
                      //               onPress: () {
                      //                 store.register();
                      //               },
                      //               text: "Registre-se",
                      //             ),
                      //           );
                      //         } else {
                      //           return Expanded(
                      //             child: PrimaryButtonWidget(
                      //               text: "Registre-se",
                      //             ),
                      //           );
                      //         }
                      //       },
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
                Observer(
                  builder: (_) {
                    if (store.loading) {
                      return Align(
                        child: DefaultProgressIndicator(),
                        alignment: Alignment.topRight,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Observer(
            builder: (_) {
              if (store.fieldsNotNull) {
                return Expanded(
                  child: PrimaryButtonWidget(
                    onPress: () {
                      store.register();
                    },
                    text: "Registre-se",
                  ),
                );
              } else {
                return Expanded(
                  child: PrimaryButtonWidget(
                    text: "Registre-se",
                    onPress: () {},
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
