import 'package:asuka/asuka.dart';
import 'package:coding_interview_frontend/app/core/theme/theme_manager/theme_manager.dart';
import 'package:flutter/material.dart';

void showSnackBarCustom(String message, {Color? color}) {
  Asuka.showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 5),
      content: Text(message, style: const TextStyle(fontSize: 16)),
      backgroundColor: color ?? ThemeManager.green,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
    ),
  );
}
