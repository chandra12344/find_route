import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapSample extends StatefulWidget {
  @override
  State createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Sample'),
      ),
      body: GoogleMap(
        // Initial camera position
        initialCameraPosition: CameraPosition(
          target: LatLng(37.7749, -122.4194), // San Francisco coordinates
          zoom: 12.0,
        ),
        // Enable the map toolbar (default is true)
        mapToolbarEnabled: true,
        // Enable my location button (default is true)
        myLocationButtonEnabled: true,
        // Add markers, polylines, etc., as needed
        markers: {
          Marker(
            markerId: MarkerId('marker1'),
            position: LatLng(37.7749, -122.4194),
            infoWindow: InfoWindow(title: 'Marker 1'),
          ),
        },
        // Other configurations as needed
        // ...
      ),
    );
  }
}