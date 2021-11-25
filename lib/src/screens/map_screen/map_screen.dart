import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transport_marker/src/domain/model/transport.dart';
import 'package:transport_marker/src/domain/utils/marker_generator.dart';
import 'package:transport_marker/src/screens/widgets.dart/transpot_icon.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(53.902334, 27.5618791), zoom: 12.0);

  late GoogleMapController _googleMapController;
  List<Marker> markers = [];

  //Example of data
  List<Transport> transports = [
    Transport(
      routeNumber: 'A13',
      timeDifference: '+01:32',
      registrationNumber: '7546',
      position: const LatLng(53.892730, 27.543453),
    ),
    Transport(
      routeNumber: 'A30',
      timeDifference: '+00:47',
      registrationNumber: '3845',
      position: const LatLng(53.892853, 27.555239),
    ),
    Transport(
      routeNumber: 'А100',
      timeDifference: '+00:22',
      registrationNumber: '6969',
      position: const LatLng(53.892998, 27.558436),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
        zoomControlsEnabled: true,
        markers: markers.toSet(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, markerWidgets);

    MarkerGenerator(markerWidgets(), (bitmaps) {
      setState(() {
        markers = mapBitmapsToMarkers(bitmaps);
      });
    }).generate(context);
  }

  List<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps) {
    List<Marker> markersList = [];
    bitmaps.asMap().forEach((i, bmp) {
      final transport = transports[i];
      markersList.add(Marker(
          markerId: MarkerId(transport.routeNumber),
          position: transport.position!,
          icon: BitmapDescriptor.fromBytes(bmp)));
    });
    return markersList;
  }

  // Transport marker widget
  Widget _transportMarkerWidget(
      String routeNumber, String timeDifference, String registrationNumber) {
    //return const TransportIcon();
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            height: 35.0,
            width: 180.0,
            padding: const EdgeInsets.only(right: 5.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50.0),
                bottomLeft: Radius.circular(50.0),
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '$routeNumber $timeDifference/ $registrationNumber',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        //const TransportIcon(),
        Positioned.fill(
          child: Container(
            height: 35.0,
            width: 35.0,
            decoration: const BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Image.asset(
              'assets/icons/bus_icon.png',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> markerWidgets() {
    return transports
        .map((transport) => _transportMarkerWidget(transport.routeNumber,
            transport.timeDifference, transport.registrationNumber))
        .toList();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }
}
