import 'package:flutter/material.dart';

class ShapeCustom extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
 /*   const RadialGradient gradient = RadialGradient(
      center: Alignment(0.7, -0.6),
      radius: 0.2,
      colors: <Color>[Color(0xFFFFFF00), Color(0xFF0099FF)],
      stops: <double>[0.4, 1.0],
    );*/
    var paint = Paint();

    paint.color = Color(0xffCCCCCC);
    paint.style = PaintingStyle.fill;

   // paint.color = Color(0xfffff600);
   // paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2.0;
    var path = Path();

    // path.moveTo(0, size.height * 0.9167);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
    //     size.width * 0.5, size.height * 0.9167);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
    //     size.width * 1.0, size.height * 0.9167);
//initialise
    path.moveTo(01, size.height-10);
    path.lineTo(10, size.height);
    path.lineTo(size.width-10, size.height);
    path.lineTo(size.width, size.height-10);
    path.lineTo(size.width+10, size.height*0.55);
    path.lineTo(size.width-10,size.height*0.2 );
    path.lineTo(size.width/2,size.height*0.12 );

    //Symetriquement
    path.lineTo(10,size.height*0.2 );
    path.lineTo(-10, size.height*0.55);
    path.lineTo(01, size.height-10);

    // path.lineTo(0, size.height*0.55);
    // path.lineTo(0,size.height*0.2 );
    // path.lineTo(size.width/2,size.height*0.12 );
   // path.lineTo(size.width-10, 2* size.height*0.4);
   // path.lineTo(size.width/2, size.height*0.2);
    //path.lineTo(size.width-30, size.height+20);
    //path.lineTo(size.width-10, 0);
    // path.lineTo(size.width+10, size.height+19);
    // path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
