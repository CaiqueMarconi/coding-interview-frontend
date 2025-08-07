import 'package:coding_interview_frontend/app/core/theme/theme_manager/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Challenge El Dorado',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.whichTheme(context),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
