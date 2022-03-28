import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/core.dart';
import '../../data/models/place_model.dart';
import '../home_store.dart';
import '../widgets/place_item_widget/place_item_widget.dart';
import '../../../../shared/widgets/app_bar/app_bar_widget.dart';
import '../../../../shared/widgets/input/input_widget.dart';
import '../../../../shared/widgets/progress_dialog/progress_dialog_widget.dart';

class SearchPage extends StatefulWidget {
  final AddressInputType addressInputType;
  const SearchPage({Key? key, required this.addressInputType})
      : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  HomeStore homeStore = Modular.get<HomeStore>();
  TextEditingController pickupController = TextEditingController(
    text: Modular.get<HomeStore>().originAddress.placeName,
  );

  TextEditingController destinationController = TextEditingController(
    text: Modular.get<HomeStore>().destinationAddress.placeName,
  );

  FocusNode focusDestination = FocusNode();

  void setFocus() {
    FocusScope.of(context).requestFocus(focusDestination);
  }

  List<PlaceModel> destinationPlaces = [];

  AddressInputType? addressInputType;

  @override
  void initState() {
    super.initState();
    addressInputType = widget.addressInputType;
  }

  @override
  void dispose() {
    super.dispose();
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
        builder: (_) => Stack(
          children: [
            Column(
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
                          onTap: () {
                            addressInputType = AddressInputType.origin;
                          },
                          onChange: (value) {
                            homeStore.searchPlace(value);
                          },
                          label: "Endereço de origem",
                          controller: pickupController,
                          focusNode: addressInputType == AddressInputType.origin
                              ? focusDestination
                              : null,
                        ),
                        SizedBox(
                          height: AppSizes.s16,
                        ),
                        InputWidget(
                          onTap: () {
                            addressInputType = AddressInputType.destination;
                          },
                          onChange: (value) {
                            homeStore.searchPlace(value);
                          },
                          focusNode:
                              addressInputType == AddressInputType.destination
                                  ? focusDestination
                                  : null,
                          label: "Endereço de destino",
                          controller: destinationController,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSizes.s16,
                ),
                if (homeStore.destinationPlaces.length > 0)
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.s16),
                      child: ListView.separated(
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return PlaceItemWidget(
                            place: homeStore.destinationPlaces[index],
                            addressInputType: addressInputType,
                            onPressed: () {
                              homeStore.getPlaceDetails(
                                  homeStore.destinationPlaces[index].placeId,
                                  addressInputType!);
                            },
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: homeStore.destinationPlaces.length,
                      ),
                    ),
                  ),
              ],
            ),
            if (homeStore.loading)
              ProgressDialog(
                status: "Aguarde...",
              ),
          ],
        ),
      )),
    );
  }
}
