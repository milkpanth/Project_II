import 'dart:async';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMap extends StatefulWidget {
  @override
  ShowMapState createState() => ShowMapState();
}

class ShowMapState extends State<ShowMap> {
  LocationData currentLocation;
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng centerMap = const LatLng(13.667708, 100.621809);

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.915161, 100.521627),
    zoom: 19,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      //target: LatLng(13.7650836, 100.5379664),
      target: LatLng(13.915161, 100.521627),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Widget myMap() {
    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  double lat, lng;
  Future<Null> findLatLng() async {
    LocationData locationData = await getCurrentLocation();
    lat = locationData.latitude;
    lng = locationData.longitude;
    print('lat = $lat, lng = $lng');
  }

  Future<LocationData> getCurrentLocation() async {
    Location location = Location();
    try {
      return location.getLocation();
    }
    //on PlatformException
    catch (e) {
      //if (e.code == 'PERMISSION_DENIED') {
      // Permission denied
      // }
      return null;
    }
  }

  Future _goToMe() async {
    final GoogleMapController controller = await _controller.future;
    currentLocation = await getCurrentLocation();
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
      zoom: 19,
    )));
  }

  // Future<void> _goMyLocation() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: myMap(),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goMyLocation,
      //   label: Text('My Location!'),
      //   icon: Icon(Icons.map_outlined),
      // ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToMe,
        label: Text('My location'),
        icon: Icon(Icons.near_me),
      ),
    );
  }
}
