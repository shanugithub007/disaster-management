// usermainpage/resource_finder.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ResourceFinder extends StatefulWidget {
  @override
  _ResourceFinderState createState() => _ResourceFinderState();
}

class _ResourceFinderState extends State<ResourceFinder> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.42796133580664, -122.085749655962); // Example: Google HQ location

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map Example'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        myLocationEnabled: true, // Enable user's current location
        myLocationButtonEnabled: true,
        mapType: MapType.normal, // Map type: normal, satellite, hybrid, terrain
      ),
    );
  }
}
