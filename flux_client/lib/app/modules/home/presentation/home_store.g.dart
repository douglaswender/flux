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

  final _$originLatLngAtom = Atom(name: 'HomeStoreBase.originLatLng');

  @override
  LatLng? get originLatLng {
    _$originLatLngAtom.reportRead();
    return super.originLatLng;
  }

  @override
  set originLatLng(LatLng? value) {
    _$originLatLngAtom.reportWrite(value, super.originLatLng, () {
      super.originLatLng = value;
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

  final _$destinationLatLngAtom = Atom(name: 'HomeStoreBase.destinationLatLng');

  @override
  LatLng? get destinationLatLng {
    _$destinationLatLngAtom.reportRead();
    return super.destinationLatLng;
  }

  @override
  set destinationLatLng(LatLng? value) {
    _$destinationLatLngAtom.reportWrite(value, super.destinationLatLng, () {
      super.destinationLatLng = value;
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
  DirectionModel? get direction {
    _$directionAtom.reportRead();
    return super.direction;
  }

  @override
  set direction(DirectionModel? value) {
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

  final _$postContainerHeightAtom =
      Atom(name: 'HomeStoreBase.postContainerHeight');

  @override
  double get postContainerHeight {
    _$postContainerHeightAtom.reportRead();
    return super.postContainerHeight;
  }

  @override
  set postContainerHeight(double value) {
    _$postContainerHeightAtom.reportWrite(value, super.postContainerHeight, () {
      super.postContainerHeight = value;
    });
  }

  final _$valueOfRunAtom = Atom(name: 'HomeStoreBase.valueOfRun');

  @override
  int? get valueOfRun {
    _$valueOfRunAtom.reportRead();
    return super.valueOfRun;
  }

  @override
  set valueOfRun(int? value) {
    _$valueOfRunAtom.reportWrite(value, super.valueOfRun, () {
      super.valueOfRun = value;
    });
  }

  final _$mapInitializedAtom = Atom(name: 'HomeStoreBase.mapInitialized');

  @override
  bool get mapInitialized {
    _$mapInitializedAtom.reportRead();
    return super.mapInitialized;
  }

  @override
  set mapInitialized(bool value) {
    _$mapInitializedAtom.reportWrite(value, super.mapInitialized, () {
      super.mapInitialized = value;
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

  final _$goToLocationMapAsyncAction =
      AsyncAction('HomeStoreBase.goToLocationMap');

  @override
  Future<void> goToLocationMap(LatLngBounds target) {
    return _$goToLocationMapAsyncAction
        .run(() => super.goToLocationMap(target));
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

  final _$getDirectionAsyncAction = AsyncAction('HomeStoreBase.getDirection');

  @override
  Future<void> getDirection() {
    return _$getDirectionAsyncAction.run(() => super.getDirection());
  }

  final _$getUserLocationAsyncAction =
      AsyncAction('HomeStoreBase.getUserLocation');

  @override
  Future getUserLocation() {
    return _$getUserLocationAsyncAction.run(() => super.getUserLocation());
  }

  final _$publishDeliveryAsyncAction =
      AsyncAction('HomeStoreBase.publishDelivery');

  @override
  Future publishDelivery(
      {required String phoneNumber,
      required String userName,
      required String userId,
      required int valueOfRun}) {
    return _$publishDeliveryAsyncAction.run(() => super.publishDelivery(
        phoneNumber: phoneNumber,
        userName: userName,
        userId: userId,
        valueOfRun: valueOfRun));
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
  dynamic setMapController(GoogleMapController thisMapController) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setMapController');
    try {
      return super.setMapController(thisMapController);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
originAddress: ${originAddress},
originLatLng: ${originLatLng},
destinationAddress: ${destinationAddress},
destinationLatLng: ${destinationLatLng},
loading: ${loading},
direction: ${direction},
polylineCoordinates: ${polylineCoordinates},
markers: ${markers},
circles: ${circles},
postContainerHeight: ${postContainerHeight},
valueOfRun: ${valueOfRun},
mapInitialized: ${mapInitialized},
destinationPlaces: ${destinationPlaces},
polylines: ${polylines},
mapController: ${mapController}
    ''';
  }
}
