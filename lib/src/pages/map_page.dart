import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class StoreMapPage extends StatefulWidget {
  @override
  _StoreMapState createState() => _StoreMapState();
}

class _StoreMapState extends State<StoreMapPage> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(4.7555381, -74.0264781);
  final Set<Marker> _markers = {};
  final String _storeName = 'Tienda';
  final String _storeAddress = 'Avenida Falsa 123';

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    _markers.add(Marker(markerId: MarkerId(_storeName),
        position: _center,
        infoWindow: InfoWindow(title: _storeName, snippet: _storeAddress)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicación de tienda'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 18.0,
        ),
      ),
    );
  }
}