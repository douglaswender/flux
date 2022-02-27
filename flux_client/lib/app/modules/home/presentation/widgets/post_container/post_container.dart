import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/shared/modules/auth/data/repositories/auth_repository_impl.dart';
import '../../../../../core/core.dart';
import '../../home_store.dart';
import '../../../../../shared/widgets/input/input_widget.dart';
import '../../../../../shared/widgets/secondary_button/secondary_button_widget.dart';
import '../../../../../shared/shared.dart';

class PostContainer extends StatefulWidget {
  final ScrollController? scrollController;
  const PostContainer({Key? key, this.scrollController}) : super(key: key);

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  HomeStore homeStore = Modular.get<HomeStore>();
  AuthRepositoryImpl authRepository = Modular.get<AuthRepositoryImpl>();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    print(authRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.s16),
      child: Observer(
        builder: (_) => Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(35))),
                ),
              ),
              SizedBox(
                height: AppSizes.s16,
              ),
              Row(
                children: [
                  Text(
                    "Olá ${authRepository.userModel!.name!.firstName()}, vai de Flux?",
                    style: AppTextStyles.body,
                  ),
                ],
              ),
              SizedBox(
                height: AppSizes.s16,
              ),
              InputWidget(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor informe um endereço de origem';
                  }
                  return null;
                },
                readOnly: true,
                onTap: () async {
                  await Modular.to.pushNamed(
                    '/home/search_page',
                    arguments: {
                      "addressInputType": AddressInputType.origin,
                    },
                  );
                  widget.scrollController!.animateTo(
                      widget.scrollController!.position.minScrollExtent,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.elasticOut);
                  setState(() {});
                },
                label: "Endereço de origem",
                controller: TextEditingController(
                  text: homeStore.originAddress.placeName ?? "",
                ),
              ),
              SizedBox(
                height: AppSizes.s16,
              ),
              InputWidget(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor informe um endereço de destino';
                  }
                  return null;
                },
                readOnly: true,
                onTap: () async {
                  await Modular.to.pushNamed(
                    '/home/search_page',
                    arguments: {
                      "addressInputType": AddressInputType.destination,
                    },
                  );
                  widget.scrollController!.animateTo(
                      widget.scrollController!.position.minScrollExtent,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.elasticOut);
                },
                label: "Endereço de destino",
                controller: TextEditingController(
                  text: homeStore.destinationAddress.placeName ?? "",
                ),
              ),
              SizedBox(
                height: AppSizes.s16,
              ),
              if (homeStore.valueOfRun != null && homeStore.direction != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "A distância da entrega é: ",
                          style: AppTextStyles.body,
                          children: [
                            TextSpan(
                              text:
                                  "${homeStore.direction!.distanceValue!.quilometers()}",
                              style: AppTextStyles.bodyMarker,
                            )
                          ]),
                    ),
                    SizedBox(
                      height: AppSizes.s8,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "O tempo estimado da entrega é: ",
                          style: AppTextStyles.body,
                          children: [
                            TextSpan(
                              text: "${homeStore.direction!.durationText!}",
                              style: AppTextStyles.bodyMarker,
                            )
                          ]),
                    ),
                    SizedBox(
                      height: AppSizes.s8,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "O valor dessa entrega é: ",
                          style: AppTextStyles.body,
                          children: [
                            TextSpan(
                              text: "${homeStore.valueOfRun.reais()}",
                              style: AppTextStyles.bodyMarker,
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: AppSizes.s16,
                    ),
                  ],
                ),
              InputWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor informe uma descrição da encomenda';
                    }
                    return null;
                  },
                  label: "Descrição da encomenda"),
              SizedBox(
                height: AppSizes.s16,
              ),
              InputWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor informe um destinatário da encomenda';
                    }
                    return null;
                  },
                  label: "Destinatário"),
              SizedBox(
                height: AppSizes.s16,
              ),
              InputWidget(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor informe um documento do destinatário (CPF ou RG)';
                    }
                    return null;
                  },
                  label: "CPF ou RG do destinatário"),
              SizedBox(
                height: AppSizes.s16,
              ),
              InputWidget(label: "Motorista"),
              SizedBox(
                height: AppSizes.s16,
              ),
              Container(
                  child: SecondaryButtonWidget(
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          print('passou');
                        }
                      },
                      text: "Publicar"))
            ],
          ),
        ),
      ),
    );
  }
}
