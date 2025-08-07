import 'package:coding_interview_frontend/app/core/theme/theme_manager/theme_manager.dart';
import 'package:flutter/material.dart';

class ExchangeRateRow extends StatelessWidget {
  final String text;
  final String rate;
  const ExchangeRateRow({super.key, required this.text, required this.rate});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: size.width * 0.04,
            color: ThemeManager.greyText,
          ),
        ),
        RichText(
          text: TextSpan(
            text: '≈ ',
            style: TextStyle(
              color: ThemeManager.greyText,
              fontSize: size.width * 0.04,
            ),
            children: [
              TextSpan(
                text: rate,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ThemeManager.greyText,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
