import 'package:coding_interview_frontend/app/exchange/exchange_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.module(Modular.initialRoute, module: ExchangeModule());
  }
}
