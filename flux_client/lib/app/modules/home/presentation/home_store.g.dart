// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$pickupAddressAtom = Atom(name: 'HomeStoreBase.pickupAddress');

  @override
  AddressModel get pickupAddress {
    _$pickupAddressAtom.reportRead();
    return super.pickupAddress;
  }

  @override
  set pickupAddress(AddressModel value) {
    _$pickupAddressAtom.reportWrite(value, super.pickupAddress, () {
      super.pickupAddress = value;
    });
  }

  final _$destinationAddressAtom =
      Atom(name: 'HomeStoreBase.destinationAddress');

  @override
  AddressModel get destinationAddress {
    _$destinationAddressAtom.reportRead();
    return super.destinationAddress;
  }

  @override
  set destinationAddress(AddressModel value) {
    _$destinationAddressAtom.reportWrite(value, super.destinationAddress, () {
      super.destinationAddress = value;
    });
  }

  final _$destinationPlacesAtom = Atom(name: 'HomeStoreBase.destinationPlaces');

  @override
  List<PlaceModel> get destinationPlaces {
    _$destinationPlacesAtom.reportRead();
    return super.destinationPlaces;
  }

  @override
  set destinationPlaces(List<PlaceModel> value) {
    _$destinationPlacesAtom.reportWrite(value, super.destinationPlaces, () {
      super.destinationPlaces = value;
    });
  }

  final _$searchPlaceAsyncAction = AsyncAction('HomeStoreBase.searchPlace');

  @override
  Future searchPlace(String placeName) {
    return _$searchPlaceAsyncAction.run(() => super.searchPlace(placeName));
  }

  final _$getPlaceDetailsAsyncAction =
      AsyncAction('HomeStoreBase.getPlaceDetails');

  @override
  Future getPlaceDetails(String placeId) {
    return _$getPlaceDetailsAsyncAction
        .run(() => super.getPlaceDetails(placeId));
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  void updatePickupAddress(AddressModel pickup) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.updatePickupAddress');
    try {
      return super.updatePickupAddress(pickup);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateDestinationPlaces(List<PlaceModel> updatedList) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.updateDestinationPlaces');
    try {
      return super.updateDestinationPlaces(updatedList);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pickupAddress: ${pickupAddress},
destinationAddress: ${destinationAddress},
destinationPlaces: ${destinationPlaces}
    ''';
  }
}
