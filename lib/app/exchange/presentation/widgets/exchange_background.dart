import 'package:coding_interview_frontend/app/core/theme/theme_manager/theme_manager.dart';
import 'package:flutter/material.dart';

class ExchangeBackground extends StatelessWidget {
  final Widget child;
  const ExchangeBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fundo azul claro
        Container(color: ThemeManager.secondaryColor),
        // Curva amarela à direita
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
        // Conteúdo por cima
        child,
      ],
    );
  }
}

class RightCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Começa no topo direito
    path.moveTo(size.width * 0.76, 0);

    // Curva descendo para esquerda e voltando para direita
    path.quadraticBezierTo(
      size.width * 0.01,
      size.height * 0.5, // ponto de controle (curva entra)
      size.width,
      size.height * 0.8, // termina no canto inferior direito
    );

    // Fecha o restante do retângulo
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
