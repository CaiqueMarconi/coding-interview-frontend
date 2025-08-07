import 'package:coding_interview_frontend/app/core/theme/images/image_manager.dart';
import 'package:coding_interview_frontend/app/exchange/domain/entities/currency_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FiatCurrencies {
  static List<FiatCurrencyEntity> fiatListL10n(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return [
      FiatCurrencyEntity(
        id: 'BRL',
        title: 'BRL',
        name: t.currency_brl,
        symbol: 'R\$',
        iconPath: ImageManager.brl,
      ),
      FiatCurrencyEntity(
        id: 'COP',
        title: 'COP',
        name: t.currency_cop,
        symbol: 'COL\$',
        iconPath: ImageManager.cop,
      ),
      FiatCurrencyEntity(
        id: 'PEN',
        title: 'PEN',
        name: t.currency_pen,
        symbol: 'S/',
        iconPath: ImageManager.pen,
      ),
      FiatCurrencyEntity(
        id: 'VES',
        title: 'VES',
        name: t.currency_ves,
        symbol: 'Bs',
        iconPath: ImageManager.ves,
      ),
    ];
  }

  static final List<FiatCurrencyEntity> fiatList = [
    FiatCurrencyEntity(
      id: 'BRL',
      title: 'BRL',
      name: 'Real Brasileño',
      symbol: 'R\$',
      iconPath: ImageManager.brl,
    ),
    FiatCurrencyEntity(
      id: 'COP',
      title: 'COP',
      name: 'Peso Colombianos',
      symbol: 'COL\$',
      iconPath: ImageManager.cop,
    ),
    FiatCurrencyEntity(
      id: 'PEN',
      title: 'PEN',
      name: 'Soles Peruanos',
      symbol: 'S/',
      iconPath: ImageManager.pen,
    ),
    FiatCurrencyEntity(
      id: 'VES',
      title: 'VES',
      name: 'Bolívares',
      symbol: 'Bs',
      iconPath: ImageManager.ves,
    ),
  ];
}
