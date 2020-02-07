import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreMapPage extends StatefulWidget {
  @override
  _StoreMapState createState() => _StoreMapState();
}

class _StoreMapState extends State<StoreMapPage> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(4.680031, -74.043106);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ubicación de tienda'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      );
  }
}