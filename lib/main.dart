import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(Way());
}

class Way extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Way',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: WayHomePage(),
    );
  }
}

class WayHomePage extends StatefulWidget {
  WayHomePage({Key? key}) : super(key: key);

  @override
  _WayHomePageState createState() => _WayHomePageState();
}

class _WayHomePageState extends State<WayHomePage> {
  late GoogleMapController mapController;

  // final LatLng _center = const LatLng(45.521563, -122.677433);
  final LatLng _center = const LatLng(5.722064888322568, -0.1762737566947552);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    int _index = 0;
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition:  CameraPosition(
          target: _center,
          zoom: 2.0,
        ),
      ),

      // make bottomNavigationBar appear on top of body
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Colors.white,
        borderRadius: 40.0,
        onTap: (int val) => setState(() => _index = val),
        currentIndex: _index,
        unselectedItemColor: Colors.black,
        selectedBackgroundColor: null,
        items: [
          FloatingNavbarItem(icon: Icons.account_circle_outlined),
          FloatingNavbarItem(icon: Icons.group_outlined),
          FloatingNavbarItem(icon: Icons.public),
          FloatingNavbarItem(icon: Icons.favorite_border_outlined),
          FloatingNavbarItem(icon: Icons.message_outlined),
        ],
      ),
    );
  }
}
