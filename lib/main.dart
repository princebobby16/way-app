import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:way_app/footer.dart';

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
      home: WayHomePage(title: 'Way'),
    );
  }
}

class WayHomePage extends StatefulWidget {
  WayHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

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
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title!),
      // ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition:  CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
