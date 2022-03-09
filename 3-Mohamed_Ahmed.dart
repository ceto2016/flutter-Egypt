import 'package:flutter/material.dart';
import 'dart:math';

class CutomeBorder extends StatelessWidget {
  const CutomeBorder({
    Key? key,
  }) : super(key: key);
  final double raduis = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mohamed Ahmed"),
          elevation: 0,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomeImageBorder(
              raduis: raduis,
              backgroindImage: const NetworkImage(
                  "https://source.unsplash.com/user/c_v_r/100x100"),
            ),
          ],
        ));
  }
}

class CustomeImageBorder extends StatelessWidget {
  const CustomeImageBorder({
    Key? key,
    required this.raduis,
    required this.backgroindImage,
  }) : super(key: key);

  final double raduis;
  final ImageProvider<Object> backgroindImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: raduis,
        width: raduis + raduis / 8,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: raduis,
                width: raduis,
                child: CustomPaint(
                  painter: Border(raduis),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                margin: const EdgeInsets.all(4.0),
                height: raduis - 8,
                width: raduis - 8,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular((raduis - 8) / 2)),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.all(7.0),
                  margin: const EdgeInsets.all(7.0),
                  height: (raduis - 14),
                  width: (raduis - 14),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: backgroindImage,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular((raduis - 14) / 2)),
                )),
            Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.camera_alt_outlined,
                    color: Colors.blue, size: (raduis / 4)))
          ],
        ),
      ),
    );
  }
}

class Border extends CustomPainter {
  final double raduis;

  Border(this.raduis);
  @override
  void paint(Canvas canvas, Size size) {
    var center = size / 2;
    var paint = Paint()..color = Colors.blue;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(center.width, center.height),
        width: raduis,
        height: raduis,
      ),
      pi + .4,
      pi - .2,
      true,
      paint,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(center.width, center.height),
        width: raduis,
        height: raduis,
      ),
      pi + pi + .4,
      pi / 2 - .2,
      true,
      paint,
    );
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(center.width, center.height),
        width: raduis,
        height: raduis,
      ),
      pi + (3 * pi / 2) + .4,
      pi / 2 - .2,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
