import 'package:flutter/material.dart';

class CustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   ///to create curved edges
    var path = Path();
    path.lineTo(0, size.height);

    ///left curve
    final leftFirstCurve = Offset(0, size.height - 20);
    final leftLastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(leftFirstCurve.dx, leftFirstCurve.dy, leftLastCurve.dx, leftLastCurve.dy);

    ///straight line
    final lineFirstCurve = Offset(0, size.height - 20);
    final lineSecondCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(lineFirstCurve.dx, lineFirstCurve.dy, lineSecondCurve.dx, lineSecondCurve.dy);

    ///right curve
    final rightFirstCurve = Offset(size.width, size.height - 20);
    final rightSecondCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(rightFirstCurve.dx, rightFirstCurve.dy, rightSecondCurve.dx, rightSecondCurve.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}