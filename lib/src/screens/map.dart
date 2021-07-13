import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:way_app/src/models/friends.dart' as friends;

class WayMap extends StatefulWidget {
  const WayMap({Key? key}) : super(key: key);

  @override
  _WayMapState createState() => _WayMapState();
}

class _WayMapState extends State<WayMap> {
  late GoogleMapController _mapController;
  final Map<String, Marker> _markers = {};
  late LatLng _center = const LatLng(5.722064888322568, -0.1762737566947552);
  final Location _location = Location();
  StreamSubscription? _streamSubscription;

  Future<void> getCurrentLocation() async {
    try{

      var currentLocation  = await _location.getLocation();
      if (_streamSubscription != null){
        await _streamSubscription!.cancel();
      }
      _streamSubscription = _location.onLocationChanged.listen((newLocationData) {
        // update the center value
        newLocationData = currentLocation;
        _center = LatLng(newLocationData.latitude!, newLocationData.longitude!);
        _mapController.animateCamera(
          CameraUpdate.newCameraPosition(CameraPosition(
            target: _center,
            tilt: 0.0,
            bearing: 0.0,
            zoom: 18.0
          ))
        );
      });

    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint('Permission denied');
      }
    }
  }

  void _onCameraMove(CameraPosition position) {
    _center = position.target;
  }

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    await getCurrentLocation();

    final usersFriends = await friends.getFriends();
    setState(() {
      _markers.clear();
      for (final friend in usersFriends.friends){
        final marker = Marker(
            markerId: MarkerId(friend.first_name),
            position: LatLng(friend.location[0], friend.location[1]),
            draggable: false,
            infoWindow: InfoWindow(
                title: friend.first_name,
                snippet: friend.phone_number
            )
        );
        _markers[friend.first_name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition:  CameraPosition(
        target: _center,
        tilt: 0,
        bearing: 0,
        zoom: 18.0,
      ),
      onCameraMove: _onCameraMove,
      markers: _markers.values.toSet(),
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
    );
  }
}
