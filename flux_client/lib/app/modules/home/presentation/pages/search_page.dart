import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/core/core.dart';
import 'package:flux_client/app/core/helpers/request_helper.dart';
import 'package:flux_client/app/modules/home/data/models/place_model.dart';
import 'package:flux_client/app/modules/home/presentation/home_store.dart';
import 'package:flux_client/app/shared/preferences/config.dart';
import 'package:flux_client/app/shared/widgets/app_bar/app_bar_widget.dart';
import 'package:flux_client/app/shared/widgets/input/input_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController pickupController = TextEditingController(
    text: Modular.get<HomeStore>().pickupAddress.placeName,
  );

  TextEditingController destinationController = TextEditingController();

  FocusNode focusDestination = FocusNode();

  void setFocus() {
    FocusScope.of(context).requestFocus(focusDestination);
  }

  void searchPlace(String placeName) async {
    if (placeName.length > 2) {
      var response = await RequestHelper.getRequest(Config.placeUrl(placeName));

      if (response == "failed") {
        return;
      }

      if (response['status'] == 'OK') {
        List<PlaceModel> list = (response['predictions'] as List)
            .map((e) => PlaceModel.fromJson(e))
            .toList();

        print(list.first.secondaryText);
      }
      print(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    setFocus();
    return Scaffold(
      appBar: AppBarDefault(
        isBackButton: true,
      ),
      body: SafeArea(
          child: Observer(
        builder: (_) => Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    spreadRadius: 0.5,
                    offset: Offset(0.7, 0.7),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(AppSizes.s16),
                child: Column(
                  children: [
                    InputWidget(
                      label: "Endereço de origem",
                      controller: pickupController,
                    ),
                    SizedBox(
                      height: AppSizes.s16,
                    ),
                    InputWidget(
                      onChange: (value) {
                        searchPlace(value);
                      },
                      focusNode: focusDestination,
                      label: "Endereço de entrega",
                      controller: destinationController,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
