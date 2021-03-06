import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/shared/modules/auth/data/repositories/auth_repository_impl.dart';
import '../../../../../core/core.dart';
import '../../home_store.dart';
import '../../../../../shared/widgets/input/input_widget.dart';
import '../../../../../shared/widgets/secondary_button/secondary_button_widget.dart';

class PostContainer extends StatefulWidget {
  final ScrollController? scrollController;
  const PostContainer({Key? key, this.scrollController}) : super(key: key);

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  HomeStore homeStore = Modular.get<HomeStore>();
  AuthRepositoryImpl authRepository = Modular.get<AuthRepositoryImpl>();

  TextEditingController? deliveryDescriptionController,
      deliveryReceiverController,
      deliveryDocumentController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    print(authRepository);
    deliveryDescriptionController = TextEditingController(
      text: homeStore.deliveryDescription ?? "",
    );

    deliveryReceiverController = TextEditingController(
      text: homeStore.deliveryReceiver ?? "",
    );

    deliveryDocumentController = TextEditingController(
      text: homeStore.deliveryDocument ?? "",
    );
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
                    "Ol?? ${authRepository.userModel!.name!.firstName()}, vai de Flux?",
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
                    return 'Por favor informe um endere??o de origem';
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
                label: "Endere??o de origem",
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
                    return 'Por favor informe um endere??o de destino';
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
                label: "Endere??o de destino",
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
                          text: "A dist??ncia da entrega ??: ",
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
                          text: "O tempo estimado da entrega ??: ",
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
                          text: "O valor dessa entrega ??: ",
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
                onChange: (value) {
                  homeStore.deliveryDescription = value;
                },
                controller: deliveryDescriptionController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor informe uma descri????o da encomenda';
                  }
                  return null;
                },
                label: "Descri????o da encomenda",
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: AppSizes.s16,
              ),
              InputWidget(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor informe um nome do destinat??rio da encomenda';
                  }
                  return null;
                },
                label: "Nome do destinat??rio",
                textInputAction: TextInputAction.next,
                onChange: (value) {
                  homeStore.deliveryReceiver = value;
                },
                controller: deliveryReceiverController,
              ),
              SizedBox(
                height: AppSizes.s16,
              ),
              InputWidget(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor informe um documento do destinat??rio (CPF ou RG)';
                  }
                  return null;
                },
                label: "CPF ou RG do destinat??rio",
                textInputAction: TextInputAction.next,
                onChange: (value) {
                  homeStore.deliveryDocument = value;
                },
                controller: deliveryDocumentController,
              ),
              SizedBox(
                height: AppSizes.s16,
              ),
              // InputWidget(label: "Motorista"),
              // SizedBox(
              //   height: AppSizes.s16,
              // ),
              Container(
                child: SecondaryButtonWidget(
                  width: MediaQuery.of(context).size.width,
                  onPress: () async {
                    if (_formKey.currentState!.validate()) {
                      await homeStore.publishDelivery(
                        phoneNumber: authRepository.userModel!.phoneNumber!,
                        userName: authRepository.userModel!.name!,
                        userId: authRepository.userModel!.id!,
                        valueOfRun: homeStore.valueOfRun!,
                        deliveryDescription: homeStore.deliveryDescription!,
                        deliveryDocument: homeStore.deliveryDocument!,
                        deliveryReceiver: homeStore.deliveryReceiver!,
                      );

                      setState(() {});
                    }
                  },
                  text: "Publicar",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
