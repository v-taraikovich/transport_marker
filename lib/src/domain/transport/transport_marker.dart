import 'package:flutter/material.dart';
import 'package:transport_marker/src/domain/model/transport.dart';

class TransportMarker extends StatefulWidget {
  final Transport? transport;
  const TransportMarker({Key? key, this.transport}) : super(key: key);

  @override
  _TransportMarkerState createState() => _TransportMarkerState();
}

class _TransportMarkerState extends State<TransportMarker> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 25.0,
          width: MediaQuery.of(context).size.width * 0.35,
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
          child: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'А42 +00:18/ 7549',
              style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: 25.0,
          width: 25.0,
          decoration: const BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          child: Image.asset('assets/icons/bus.png'),
        ),
      ],
    );
  }
}
