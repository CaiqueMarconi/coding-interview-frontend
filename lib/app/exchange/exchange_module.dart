import 'package:coding_interview_frontend/app/core/core_module.dart';
import 'package:coding_interview_frontend/app/exchange/domain/repositories/i_get_Exchange_rate_repository.dart';
import 'package:coding_interview_frontend/app/exchange/domain/usecases/get_exchange_rate/get_exchange_rate_usecase.dart';
import 'package:coding_interview_frontend/app/exchange/domain/usecases/get_exchange_rate/i_get_exchange_rate_usecase.dart';
import 'package:coding_interview_frontend/app/exchange/external/datasources/get_exchange_rate_datasource.dart';
import 'package:coding_interview_frontend/app/exchange/infra/datasources/i_get_exchange_rate_datasource.dart';
import 'package:coding_interview_frontend/app/exchange/infra/repositories/get_exchange_rate_repository.dart';

import 'package:coding_interview_frontend/app/exchange/presentation/controllers/exchange_controller.dart';
import 'package:coding_interview_frontend/app/exchange/presentation/pages/exchange_screen.dart';
import 'package:coding_interview_frontend/app/exchange/presentation/stores/exchange_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExchangeModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    super.binds(i);

    i.addLazySingleton(ExchangeController.new);
    i.addLazySingleton(ExchangeStore.new);

    i.addLazySingleton<IGetExchangeRateUsecase>(GetExchangeRateUsecase.new);
    i.addLazySingleton<IGetExchangeRateRepository>(
      GetExchangeRateRepository.new,
    );
    i.addLazySingleton<IGetExchangeRateDatasource>(
      GetExchangeRateDatasource.new,
    );
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.child(
      '/',
      child:
          (_) => ExchangeScreen(
            exchangeController: Modular.get<ExchangeController>(),
          ),
    );
  }
}
