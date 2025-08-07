import 'package:coding_interview_frontend/app/core/theme/theme_manager/theme_manager.dart';
import 'package:flutter/material.dart';

class ExchangeBackground extends StatelessWidget {
  final Widget child;
  const ExchangeBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: ThemeManager.secondaryColor),
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: ClipPath(
              clipper: RightCurveClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                color: ThemeManager.primaryColor,
              ),
            ),
          ),
        ),

        child,
      ],
    );
  }
}

class RightCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(size.width * 0.76, 0);

    path.quadraticBezierTo(
      size.width * 0.01,
      size.height * 0.5,
      size.width,
      size.height * 0.8,
    );

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
