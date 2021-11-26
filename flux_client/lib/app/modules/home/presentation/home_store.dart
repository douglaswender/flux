import 'package:flutter_modular/flutter_modular.dart';
import 'package:flux_client/app/core/helpers/helper_methods.dart';
import 'package:flux_client/app/core/helpers/request_helper.dart';
import 'package:flux_client/app/modules/home/data/models/address_model.dart';
import 'package:flux_client/app/modules/home/data/models/direction_model.dart';
import 'package:flux_client/app/modules/home/data/models/place_model.dart';
import 'package:flux_client/app/shared/preferences/config.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

enum AddressInputType {
  origin,
  destination,
}

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  AddressModel originAddress = AddressModel();

  @observable
  AddressModel destinationAddress = AddressModel();

  @observable
  bool loading = false;

  @observable
  DirectionModel direction = DirectionModel();

  @action
  void updatePickupAddress(AddressModel pickup) {
    originAddress = pickup;
  }

  @observable
  List<PlaceModel> destinationPlaces = [];

  @action
  updateDestinationPlaces(List<PlaceModel> updatedList) {
    destinationPlaces = updatedList;
  }

  @action
  searchPlace(String placeName) async {
    if (placeName.length > 2) {
      //TODO: Jogar método pra dentro do helper methods retornando o address model

      var response = await RequestHelper.getRequest(Config.placeUrl(placeName));

      if (response == "failed") {
        return;
      }

      if (response['status'] == 'OK') {
        List<PlaceModel> list = (response['predictions'] as List)
            .map((e) => PlaceModel.fromJson(e))
            .toList();

        print(list.first.secondaryText);
        updateDestinationPlaces(list);
      }
      print(destinationPlaces);
    }
  }

  @action
  getPlaceDetails(String placeId, AddressInputType addressInputType) async {
    loading = true;
    //TODO: Jogar método pra dentro do helper methods retornando o address model
    var response =
        await RequestHelper.getRequest(Config.placeDetailsUrl(placeId));

    loading = false;

    if (response == 'failed' || response['status'] != 'OK') {
      return;
    }

    AddressModel thisPlace = AddressModel(
      placeName: response['result']['name'],
      placeId: placeId,
      latitude: response['result']['geometry']['location']['lat'],
      longitude: response['result']['geometry']['location']['lng'],
    );
    if (addressInputType == AddressInputType.destination) {
      destinationAddress = thisPlace;
    } else {
      originAddress = thisPlace;
    }
    if (destinationAddress.latitude != null &&
        destinationAddress.longitude != null &&
        originAddress.latitude != null &&
        originAddress.longitude != null) {
      await getDirection();
      Modular.to.pop();
    }
  }

  @action
  Future<void> getDirection() async {
    loading = true;
    DirectionModel direction = await HelperMethods.getDirectionDetails(
      LatLng(originAddress.latitude!, originAddress.longitude!),
      LatLng(destinationAddress.latitude!, destinationAddress.longitude!),
    );
    loading = false;

    print(direction.encondedPoints);
  }
}
