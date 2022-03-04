import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../shared/modules/auth/data/repositories/auth_repository_impl.dart';
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
  final _formKey = GlobalKey<FormState>();
  AuthRepositoryImpl authRepository = Modular.get<AuthRepositoryImpl>();
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
          child: Form(
            key: _formKey,
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
                              "https://conteudo.imguol.com.br/c/noticias/41/2021/11/11/11nov2021---o-ex-presidente-luiz-inacio-lula-da-silva-pt-em-berlim-na-alemanha-1636644440404_v2_450x337.jpg"))),
                ),
                SizedBox(
                  height: AppSizes.s24,
                ),
                InputWidget(
                  label: "Nome completo",
                  controller: TextEditingController(
                      text: authRepository.userModel!.name),
                ),
                SizedBox(
                  height: AppSizes.s24,
                ),
                InputWidget(
                  label: "Telefone",
                  controller: TextEditingController(
                      text: authRepository.userModel!.phoneNumber),
                ),
                SizedBox(
                  height: AppSizes.s24,
                ),
                InputWidget(
                  label: "Email",
                  controller: TextEditingController(
                    text: authRepository.userModel!.email,
                  ),
                ),
                SizedBox(
                  height: AppSizes.s24,
                ),
                Row(
                  children: [
                    Expanded(
                        child: SecondaryButtonWidget(
                      text: 'Salvar',
                      onPress: null,
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(AppSizes.s32),
        child: Row(
          children: [
            Expanded(
              child: PrimaryButtonWidget(
                  onPress: () {
                    authRepository.logout();
                    Modular.to.navigate('/');
                  },
                  text: "Sair"),
            ),
          ],
        ),
      ),
    );
  }
}
