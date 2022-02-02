// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$originAddressAtom = Atom(name: 'HomeStoreBase.originAddress');

  @override
  AddressModel get originAddress {
    _$originAddressAtom.reportRead();
    return super.originAddress;
  }

  @override
  set originAddress(AddressModel value) {
    _$originAddressAtom.reportWrite(value, super.originAddress, () {
      super.originAddress = value;
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

  final _$loadingAtom = Atom(name: 'HomeStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$directionAtom = Atom(name: 'HomeStoreBase.direction');

  @override
  DirectionModel get direction {
    _$directionAtom.reportRead();
    return super.direction;
  }

  @override
  set direction(DirectionModel value) {
    _$directionAtom.reportWrite(value, super.direction, () {
      super.direction = value;
    });
  }

  final _$polylineCoordinatesAtom =
      Atom(name: 'HomeStoreBase.polylineCoordinates');

  @override
  List<LatLng> get polylineCoordinates {
    _$polylineCoordinatesAtom.reportRead();
    return super.polylineCoordinates;
  }

  @override
  set polylineCoordinates(List<LatLng> value) {
    _$polylineCoordinatesAtom.reportWrite(value, super.polylineCoordinates, () {
      super.polylineCoordinates = value;
    });
  }

  final _$markersAtom = Atom(name: 'HomeStoreBase.markers');

  @override
  Set<Marker> get markers {
    _$markersAtom.reportRead();
    return super.markers;
  }

  @override
  set markers(Set<Marker> value) {
    _$markersAtom.reportWrite(value, super.markers, () {
      super.markers = value;
    });
  }

  final _$circlesAtom = Atom(name: 'HomeStoreBase.circles');

  @override
  Set<Circle> get circles {
    _$circlesAtom.reportRead();
    return super.circles;
  }

  @override
  set circles(Set<Circle> value) {
    _$circlesAtom.reportWrite(value, super.circles, () {
      super.circles = value;
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

  final _$polylinesAtom = Atom(name: 'HomeStoreBase.polylines');

  @override
  Set<Polyline> get polylines {
    _$polylinesAtom.reportRead();
    return super.polylines;
  }

  @override
  set polylines(Set<Polyline> value) {
    _$polylinesAtom.reportWrite(value, super.polylines, () {
      super.polylines = value;
    });
  }

  final _$mapControllerAtom = Atom(name: 'HomeStoreBase.mapController');

  @override
  GoogleMapController? get mapController {
    _$mapControllerAtom.reportRead();
    return super.mapController;
  }

  @override
  set mapController(GoogleMapController? value) {
    _$mapControllerAtom.reportWrite(value, super.mapController, () {
      super.mapController = value;
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
  Future getPlaceDetails(String placeId, AddressInputType addressInputType) {
    return _$getPlaceDetailsAsyncAction
        .run(() => super.getPlaceDetails(placeId, addressInputType));
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
originAddress: ${originAddress},
destinationAddress: ${destinationAddress},
loading: ${loading},
direction: ${direction},
polylineCoordinates: ${polylineCoordinates},
markers: ${markers},
circles: ${circles},
destinationPlaces: ${destinationPlaces},
polylines: ${polylines},
mapController: ${mapController}
    ''';
  }
}
