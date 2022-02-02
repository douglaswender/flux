import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/core/core.dart';
import 'package:flux_client/app/shared/widgets/input/input_widget.dart';
import 'package:flux_client/app/shared/widgets/secondary_button/secondary_button_widget.dart';

import '../../home_store.dart';

class PostContainer extends StatefulWidget {
  const PostContainer({Key? key}) : super(key: key);

  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  HomeStore homeStore = Modular.get<HomeStore>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.s16),
      child: Observer(
        builder: (_) => Column(
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
                  "Olá Douglas, vai de Flux?",
                  style: AppTextStyles.body,
                ),
              ],
            ),
            SizedBox(
              height: AppSizes.s16,
            ),
            InputWidget(
              readOnly: true,
              onTap: () async {
                await Modular.to.pushNamed(
                  '/search_page',
                  arguments: {
                    "addressInputType": AddressInputType.origin,
                  },
                );
                //setState(() {});
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
              readOnly: true,
              onTap: () async {
                await Modular.to.pushNamed(
                  '/search_page',
                  arguments: {
                    "addressInputType": AddressInputType.destination,
                  },
                );
              },
              label: "Endereço de destino",
              controller: TextEditingController(
                text: homeStore.destinationAddress.placeName ?? "",
              ),
            ),
            SizedBox(
              height: AppSizes.s16,
            ),
            InputWidget(label: "Descrição da encomenda"),
            SizedBox(
              height: AppSizes.s16,
            ),
            InputWidget(label: "Destinatário"),
            SizedBox(
              height: AppSizes.s16,
            ),
            InputWidget(label: "Motorista"),
            SizedBox(
              height: AppSizes.s16,
            ),
            SecondaryButtonWidget(onPress: () {}, text: "Publicar")
          ],
        ),
      ),
    );
  }
}
