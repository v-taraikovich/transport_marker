import 'package:flutter/material.dart';

class TransportIcon extends StatelessWidget {
  const TransportIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 25.0,
          height: 25.0,
          color: Colors.white,
          child: CustomPaint(
            painter: TransportIconPainter(),
            child: const Center(
              child: SizedBox(
                width: 14.0,
                height: 14.0,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 3.0),
                  child: Image(
                    image: AssetImage('assets/icons/bus_icon.png'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TransportIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint
      ..color = Colors.lightGreen
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    double width = size.width;
    double height = size.height;

    Path path = Path();
    path.moveTo(0.5 * width, 0);
    path.cubicTo(
        0.1 * width, 0, -0.2 * width, height * 0.5, 0.5 * width, height);
    path.moveTo(0.5 * width, height * 0);
    path.cubicTo(
        0.9 * width, 0, 1.2 * width, height * 0.5, 0.5 * width, height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
