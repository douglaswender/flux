import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../core/core.dart';
import '../../../core/styles/app_keyboards.dart';
import '../../../shared/widgets/app_bar/app_bar_widget.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(
        isBackButton: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(AppSizes.s16),
                  child: Form(
                    key: _formKey,
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
                          },
                          type: AppKeyboards.normal,
                        ),
                        SizedBox(
                          height: AppSizes.s16,
                        ),
                        InputWidget(
                          isCapitalization: true,
                          label: "Modelo do carro",
                          textInputAction: TextInputAction.next,
                          onChange: (model) {
                            store.carModel = model;
                          },
                          type: AppKeyboards.normal,
                        ),
                        SizedBox(
                          height: AppSizes.s16,
                        ),
                        InputWidget(
                          isCapitalization: true,
                          label: "Cor do carro",
                          textInputAction: TextInputAction.next,
                          onChange: (carColor) {
                            store.carColor = carColor;
                          },
                          type: AppKeyboards.normal,
                        ),
                        SizedBox(
                          height: AppSizes.s16,
                        ),
                        InputWidget(
                          isCapitalization: true,
                          label: "Placa do carro",
                          textInputAction: TextInputAction.next,
                          onChange: (carId) {
                            store.carId = carId;
                          },
                          type: AppKeyboards.normal,
                        ),
                        SizedBox(
                          height: AppSizes.s16,
                        ),
                        InputWidget(
                          maskFormatter: [
                            MaskTextInputFormatter(
                                mask: '(##) #####-####',
                                filter: {"#": RegExp(r'[0-9]')})
                          ],
                          isCapitalization: true,
                          label: "Telefone",
                          textInputAction: TextInputAction.next,
                          onChange: (phoneNumber) {
                            store.phoneNumber = phoneNumber;
                            print(store.phoneNumber);
                          },
                          type: AppKeyboards.number,
                        ),
                        SizedBox(
                          height: AppSizes.s16,
                        ),
                        InputWidget(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, informe a senha!';
                            } else if (value.length < 6) {
                              return 'Por favor, informe uma senha com no mínimo 6 caracteres';
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, informe a senha!';
                            } else if (value != store.password) {
                              return 'Senhas não conferem, por favor, verifique a senha!';
                            }
                            return null;
                          },
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
      bottomSheet: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Observer(
            builder: (_) {
              if (store.fieldsNotNull) {
                return Expanded(
                  child: PrimaryButtonWidget(
                    onPress: () {
                      if (_formKey.currentState!.validate()) {
                        print('passou');
                        store.register();
                      }
                    },
                    text: "Registre-se",
                  ),
                );
              } else {
                return Expanded(
                  child: PrimaryButtonWidget(
                    text: "Registre-se",
                    onPress: null,
                  ),
                );
              }
            },
          ),
        ],
      ),
      // bottomNavigationBar: Row(
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
      //               onPress: null,
      //             ),
      //           );
      //         }
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}
