import 'package:flux_client/app/core/helpers/request_helper.dart';
import 'package:flux_client/app/modules/home/data/models/address_model.dart';
import 'package:flux_client/app/modules/home/data/models/place_model.dart';
import 'package:flux_client/app/shared/preferences/config.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  AddressModel pickupAddress = AddressModel();

  @observable
  AddressModel destinationAddress = AddressModel();

  @observable
  bool loading = false;

  @action
  void updatePickupAddress(AddressModel pickup) {
    pickupAddress = pickup;
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
  getPlaceDetails(String placeId) async {
    loading = true;
    var response =
        await RequestHelper.getRequest(Config.placeDetailsUrl(placeId));

    if (response == 'failed' || response['status'] != 'OK') {
      return;
    }

    AddressModel thisPlace = AddressModel(
      placeName: response['result']['name'],
      placeId: placeId,
      latitude: response['result']['geometry']['location']['lat'],
      longitude: response['result']['geometry']['location']['lng'],
    );

    destinationAddress = thisPlace;
    print(destinationAddress.placeName);
  }
}
