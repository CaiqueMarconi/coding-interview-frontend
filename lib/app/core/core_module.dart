import 'package:coding_interview_frontend/app/core/shared/services/http_service/http_service.dart';
import 'package:coding_interview_frontend/app/core/shared/services/http_service/i_http_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  void exportedBinds(Injector i) {
    super.exportedBinds(i);
    i.addLazySingleton<IHttpService>(HttpService.new);
    i.addInstance(Dio());
  }
}
