import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_rider/app/modules/login/presentation/login_store.dart';
import 'package:flux_rider/app/shared/widgets/primary_button/primary_button_widget.dart';
import '../../../core/core.dart';
import '../../../shared/modules/auth/data/models/user_model.dart';
import '../../../shared/modules/auth/data/repositories/auth_repository_impl.dart';
import '../../../shared/widgets/app_bar/app_bar_widget.dart';
import '../../../shared/widgets/secondary_button/secondary_button_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  AuthRepositoryImpl authRepository = Modular.get<AuthRepositoryImpl>();

  UserModel? user;

  @override
  void initState() {
    super.initState();
  }

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
                        //TODO: ajustar imagem para quando for null e pegar do usuário.
                        image: NetworkImage(
                            "https://conteudo.imguol.com.br/c/noticias/41/2021/11/11/11nov2021---o-ex-presidente-luiz-inacio-lula-da-silva-pt-em-berlim-na-alemanha-1636644440404_v2_450x337.jpg"))),
              ),
              SizedBox(
                height: AppSizes.s8,
              ),
              Text(
                authRepository.userModel!.name!.secondName(),
                style: AppTextStyles.heading36,
              ),
              SizedBox(
                height: AppSizes.s24,
              ),
              PrimaryButtonWidget(
                  onPress: () {
                    authRepository.logout();
                    Modular.to.navigate('/');
                  },
                  text: "Sair")
            ],
          ),
        ),
      ),
    );
  }
}
