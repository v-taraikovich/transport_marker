import 'package:google_maps_flutter/google_maps_flutter.dart';

class Transport {
  final String routeNumber;
  final String timeDifference;
  final String registrationNumber;
  final LatLng? position;

  Transport({
    required this.routeNumber,
    required this.registrationNumber,
    required this.timeDifference,
    this.position,
  });
}
