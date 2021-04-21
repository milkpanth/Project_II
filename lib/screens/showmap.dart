import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMap extends StatefulWidget {
  @override
  ShowMapState createState() => ShowMapState();
}

class ShowMapState extends State<ShowMap> {
  static const LatLng centerMap = const LatLng(13.667708, 100.621809);
  Widget myMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: centerMap,
        zoom: 16.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: myMap(),
    );
  }
}
