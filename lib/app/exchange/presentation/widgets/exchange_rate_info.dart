import 'package:coding_interview_frontend/app/exchange/presentation/controllers/exchange_controller.dart';
import 'package:coding_interview_frontend/app/exchange/presentation/widgets/exchange_rate_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExchangeRateInfo extends StatelessWidget {
  final ExchangeController exchangeController;
  const ExchangeRateInfo({super.key, required this.exchangeController});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return ScopedBuilder(
      store: exchangeController.exchangeStore,
      onState: (context, state) {
        return Column(
          children: [
            ExchangeRateRow(
              text: t.label_estimated_rate,
              rate:
                  '${exchangeController.exchangeResponse.estimatedRate} ${exchangeController.toCurrency.symbol}',
            ),
            ExchangeRateRow(
              text: t.label_you_will_receive,
              rate:
                  '${exchangeController.exchangeResponse.receive} ${exchangeController.toCurrency.symbol}',
            ),
            ExchangeRateRow(
              text: t.label_estimated_time,
              rate: '${exchangeController.exchangeResponse.estimatedTime} min',
            ),
          ],
        );
      },
    );
  }
}
