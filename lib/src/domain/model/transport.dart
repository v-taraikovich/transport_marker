import 'package:google_maps_flutter/google_maps_flutter.dart';

class Transport {
  final LatLng latLng;
  final String number;
  final int type;
  final String timeDifference;

  Transport({
    required this.latLng,
    required this.number,
    required this.type,
    required this.timeDifference,
  });
}
