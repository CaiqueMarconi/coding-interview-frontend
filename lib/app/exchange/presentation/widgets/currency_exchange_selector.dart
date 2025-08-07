import 'package:coding_interview_frontend/app/core/theme/theme_manager/theme_manager.dart';
import 'package:coding_interview_frontend/app/exchange/presentation/controllers/exchange_controller.dart';
import 'package:coding_interview_frontend/app/exchange/presentation/widgets/currency_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrencyExchangeSelector extends StatefulWidget {
  final ExchangeController exchangeController;
  const CurrencyExchangeSelector({super.key, required this.exchangeController});

  @override
  State<CurrencyExchangeSelector> createState() =>
      _CurrencyExchangeSelectorState();
}

class _CurrencyExchangeSelectorState extends State<CurrencyExchangeSelector>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() {
    _controller.reset();
    _controller.forward();
  }

  void openSelectorCurrency({
    required BuildContext context,
    required bool isFrom,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder:
          (_) => CurrencyBottomSheet(
            selected: widget.exchangeController.selectedCurrency,
            items: widget.exchangeController.getListCurrencies(context),
            isFrom: isFrom,
            onSelect:
                (v) =>
                    widget.exchangeController.onUpdateCurrencyParam(isFrom, v),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final t = AppLocalizations.of(context)!;
    return ScopedBuilder(
      store: widget.exchangeController.exchangeStore,
      onState: (context, state) {
        return SizedBox(
          height: size.height * 0.074,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: size.height * 0.054,

                decoration: BoxDecoration(
                  color: ThemeManager.white,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: ThemeManager.primaryColor,
                    width: 2,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          widget.exchangeController.onSelectCurrency(
                            widget.exchangeController.fromCurrency,
                          );
                          openSelectorCurrency(context: context, isFrom: true);
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              widget.exchangeController.fromCurrency.iconPath ??
                                  '',
                              scale: 3.6,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              widget.exchangeController.fromCurrency.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ThemeManager.greyText,
                                fontSize: size.width * 0.036,
                              ),
                            ),
                            Icon(
                              Icons.expand_more,
                              color: ThemeManager.greyText,
                              size: size.width * 0.07,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _playAnimation();
                        widget.exchangeController.invert();
                      },
                      child: Lottie.asset(
                        'assets/lotties/swap_button.json',
                        controller: _controller,
                        onLoaded: (composition) {
                          _controller.duration = composition.duration ~/ 4;
                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          widget.exchangeController.onSelectCurrency(
                            widget.exchangeController.toCurrency,
                          );
                          openSelectorCurrency(context: context, isFrom: false);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              widget.exchangeController.toCurrency.iconPath ??
                                  '',
                              scale: 3.6,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              widget.exchangeController.toCurrency.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: ThemeManager.greyText,
                                fontSize: size.width * 0.036,
                              ),
                            ),
                            Icon(
                              Icons.expand_more,
                              color: ThemeManager.greyText,
                              size: size.width * 0.07,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: ThemeManager.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.01,
                        ),
                        child: Text(
                          t.label_tengo.toUpperCase(),
                          style: TextStyle(
                            fontSize: size.width * 0.0263,
                            color: ThemeManager.greyText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        color: ThemeManager.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.01,
                        ),
                        child: Text(
                          t.label_quiero.toUpperCase(),
                          style: TextStyle(
                            fontSize: size.width * 0.0263,
                            color: ThemeManager.greyText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
