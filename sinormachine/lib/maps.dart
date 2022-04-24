import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/foundation.dart';




class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.490596, 36.298333),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(33.490596, 36.298333),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapToolbarEnabled: true,


        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: {
          Marker(
          markerId: MarkerId('one'),
          position:  LatLng(33.490596, 36.298333),
          icon: BitmapDescriptor.defaultMarker,
          visible: true,
            infoWindow: InfoWindow(title: 'ميدان' , snippet: 'تحت الجسر'),
          ),
          Marker(
            markerId: MarkerId('two'),
            position:  LatLng(33.490590, 36.321588),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
            visible: true,
            infoWindow: InfoWindow(title: 'الهمك' , snippet: '121'),
          ),
          Marker(
            markerId: MarkerId('three'),
            position:  LatLng(33.460590, 36.261588),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
            visible: true,
            infoWindow: InfoWindow(title: 'كفرسوسة' , snippet: '121'),
          )

        },

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To nearest coffee'),
        icon: Icon(Icons.local_cafe),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}