import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flux_client/app/core/helpers/helper_methods.dart';
import 'package:flux_client/app/core/helpers/request_helper.dart';
import 'package:flux_client/app/modules/home/data/models/address_model.dart';
import 'package:flux_client/app/modules/home/data/models/direction_model.dart';
import 'package:flux_client/app/modules/home/data/models/place_model.dart';
import 'package:flux_client/app/shared/preferences/config.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'dart:async';

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
  LatLng? originLatLng;

  @observable
  AddressModel destinationAddress = AddressModel();

  @observable
  LatLng? destinationLatLng;

  @observable
  bool loading = false;

  @observable
  DirectionModel? direction;

  @observable
  List<LatLng> polylineCoordinates = [];

  @observable
  Set<Marker> markers = {};

  @observable
  Set<Circle> circles = {};

  @observable
  double postContainerHeight = 0.5;

  @observable
  int? valueOfRun;

  @observable
  bool mapInitialized = false;

  @action
  void updatePickupAddress(AddressModel pickup) {
    loading = true;
    originAddress = pickup;
    loading = false;
  }

  @observable
  List<PlaceModel> destinationPlaces = [];

  Polyline? polyline;

  @observable
  Set<Polyline> polylines = {};

  @observable
  GoogleMapController? mapController;

  Completer<GoogleMapController> _mapController = Completer();

  @action
  updateDestinationPlaces(List<PlaceModel> updatedList) {
    destinationPlaces = updatedList;
  }

  @action
  setMapController(GoogleMapController thisMapController) {
    _mapController.complete(thisMapController);
    mapInitialized = true;
  }

  @action
  Future<void> goToLocationMap(LatLngBounds target) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newLatLngBounds(target, 40));
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

        updateDestinationPlaces(list);
      }
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
      getDirection();
      updateDestinationPlaces([]);
    }
    Modular.to.pop();
  }

  @action
  Future<void> getDirection() async {
    loading = true;
    //limpa todas as coordenadas das linhas.
    polylineCoordinates.clear();

    //limpa direções
    direction = null;
    DirectionModel thisDirection = await HelperMethods.getDirectionDetails(
      LatLng(originAddress.latitude!, originAddress.longitude!),
      LatLng(destinationAddress.latitude!, destinationAddress.longitude!),
    );
    direction = thisDirection;

    //seta valor da origem
    originLatLng = LatLng(originAddress.latitude!, originAddress.longitude!);

    PolylinePoints polylinePoints = PolylinePoints();
    List<PointLatLng> results =
        polylinePoints.decodePolyline(thisDirection.encondedPoints!);

    if (results.isNotEmpty) {
      results.forEach((point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    Set<Polyline> thisPolylines = {};
    polylines.clear();
    polyline = Polyline(
      polylineId: PolylineId('id'),
      color: Color.fromARGB(255, 95, 109, 237),
      points: polylineCoordinates,
      jointType: JointType.round,
      width: 3,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
    );

    thisPolylines.add(polyline!);

    polylines = thisPolylines;

    LatLngBounds bounds;

    if (originAddress.latitude! > destinationAddress.latitude! &&
        originAddress.longitude! > destinationAddress.longitude!) {
      bounds = LatLngBounds(
        southwest: LatLng(
          destinationAddress.latitude!,
          destinationAddress.longitude!,
        ),
        northeast: LatLng(
          originAddress.latitude!,
          originAddress.longitude!,
        ),
      );
    } else if (originAddress.longitude! > destinationAddress.longitude!) {
      bounds = LatLngBounds(
        southwest: LatLng(
          originAddress.latitude!,
          destinationAddress.longitude!,
        ),
        northeast: LatLng(
          destinationAddress.latitude!,
          originAddress.longitude!,
        ),
      );
    } else if (originAddress.latitude! > destinationAddress.latitude!) {
      bounds = LatLngBounds(
        southwest: LatLng(
          destinationAddress.latitude!,
          originAddress.longitude!,
        ),
        northeast: LatLng(
          originAddress.latitude!,
          destinationAddress.longitude!,
        ),
      );
    } else {
      bounds = LatLngBounds(
        southwest: LatLng(
          originAddress.latitude!,
          originAddress.longitude!,
        ),
        northeast: LatLng(
          destinationAddress.latitude!,
          destinationAddress.longitude!,
        ),
      );
    }

    final target = calculateCenterBounds(bounds);
    originLatLng = target;
    await goToLocationMap(bounds);

    Marker originMarker = Marker(
      markerId: MarkerId('origin'),
      position: LatLng(originAddress.latitude!, originAddress.longitude!),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(
        title: originAddress.placeName,
        snippet: originAddress.placeFormattedAddress,
      ),
    );

    Marker destinationMarker = Marker(
      markerId: MarkerId('destination'),
      position: LatLng(
        destinationAddress.latitude!,
        destinationAddress.longitude!,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(
        title: destinationAddress.placeName,
        snippet: destinationAddress.placeFormattedAddress,
      ),
    );

    markers.clear();

    markers.add(originMarker);
    markers.add(destinationMarker);

    markers = markers;

    Circle originCircle = Circle(
      circleId: CircleId('origin'),
      strokeColor: Colors.black,
      strokeWidth: 3,
      radius: 12,
      center: LatLng(originAddress.latitude!, originAddress.longitude!),
      fillColor: Colors.black38,
    );

    Circle destinationCircle = Circle(
      circleId: CircleId('destination'),
      strokeColor: Colors.black,
      strokeWidth: 3,
      radius: 12,
      center:
          LatLng(destinationAddress.latitude!, destinationAddress.longitude!),
      fillColor: Colors.black38,
    );

    circles.clear();

    circles.add(originCircle);
    circles.add(destinationCircle);

    circles = circles;

    valueOfRun = HelperMethods.estimateFares(direction!);

    loading = false;
  }

  @action
  getUserLocation() async {
    loading = true;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    originLatLng = LatLng(position.latitude, position.longitude);

    if (originAddress.placeName == null) {
      AddressModel address = await HelperMethods.findCordinateAddress(position);
      updatePickupAddress(address);
    }
    loading = false;
  }

  LatLng calculateCenterBounds(LatLngBounds bounds) {
    return LatLng((bounds.northeast.latitude + bounds.southwest.latitude) / 2,
        (bounds.northeast.longitude + bounds.southwest.longitude) / 2);
  }
}
