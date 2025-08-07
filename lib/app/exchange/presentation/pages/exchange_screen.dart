import 'package:coding_interview_frontend/app/core/theme/theme_manager/theme_manager.dart';
import 'package:coding_interview_frontend/app/exchange/presentation/controllers/exchange_controller.dart';
import 'package:coding_interview_frontend/app/exchange/presentation/widgets/currency_exchange_selector.dart';
import 'package:coding_interview_frontend/app/exchange/presentation/widgets/exchange_background.dart';
import 'package:coding_interview_frontend/app/exchange/presentation/widgets/exchange_rate_row.dart';
import 'package:coding_interview_frontend/app/exchange/presentation/widgets/text_input_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExchangeScreen extends StatefulWidget {
  final ExchangeController exchangeController;
  const ExchangeScreen({super.key, required this.exchangeController});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      body: ExchangeBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              height: size.height * 0.4,
              decoration: BoxDecoration(
                color: ThemeManager.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  CurrencyExchangeSelector(
                    exchangeController: widget.exchangeController,
                  ),
                  SizedBox(height: size.height * 0.014),
                  ScopedBuilder(
                    store: widget.exchangeController.exchangeStore,
                    onState:
                        (context, state) => Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ThemeManager.primaryColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(
                              size.width * 0.04,
                            ),
                            color: ThemeManager.white,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),

                          child: TextInputValue(
                            formKey: _formKey,
                            currencyId:
                                widget.exchangeController.fromCurrency.title,
                            exchangeController: widget.exchangeController,
                          ),
                        ),
                  ),

                  SizedBox(height: size.height * 0.02),
                  ScopedBuilder(
                    store: widget.exchangeController.exchangeStore,
                    onState: (context, state) {
                      return Column(
                        children: [
                          ExchangeRateRow(
                            text: t.label_estimated_rate,
                            rate:
                                '${widget.exchangeController.exchangeResponse.estimatedRate} ${widget.exchangeController.toCurrency.symbol}',
                          ),
                          ExchangeRateRow(
                            text: t.label_you_will_receive,
                            rate:
                                '${widget.exchangeController.exchangeResponse.receive} ${widget.exchangeController.toCurrency.symbol}',
                          ),
                          ExchangeRateRow(
                            text: t.label_estimated_time,
                            rate:
                                '${widget.exchangeController.exchangeResponse.estimatedTime} min',
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: size.height * 0.02),
                  SizedBox(
                    width: size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ThemeManager.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            size.width * 0.04,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.04,
                          vertical: size.height * 0.014,
                        ),
                      ),
                      onPressed: () async {
                        _formKey.currentState?.save();
                        await widget.exchangeController.getExchangeRate();
                      },
                      child: Text(
                        t.exchange,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
