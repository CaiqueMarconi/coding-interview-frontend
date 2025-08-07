import 'package:coding_interview_frontend/app/core/theme/theme_manager/theme_manager.dart';
import 'package:coding_interview_frontend/app/core/utils/currency_input_formatter.dart';
import 'package:coding_interview_frontend/app/exchange/presentation/controllers/exchange_controller.dart';
import 'package:flutter/material.dart';

class TextInputValue extends StatelessWidget {
  final String currencyId;
  final GlobalKey<FormState> formKey;
  final ExchangeController exchangeController;
  const TextInputValue({
    super.key,
    required this.currencyId,
    required this.formKey,
    required this.exchangeController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$currencyId ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ThemeManager.primaryColor,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Form(
            key: formKey,
            child: TextFormField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [CurrencyInputFormatter()],

              style: const TextStyle(fontSize: 16, color: Colors.black),
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: '0.00',
                hintStyle: TextStyle(color: Colors.grey),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
              onSaved: (v) {
                final cleaned = v!.replaceAll(RegExp(r'[^0-9]'), '');
                final amount =
                    double.tryParse(cleaned) != null
                        ? double.parse(cleaned) / 100
                        : 0.0;

                exchangeController.onChangeAmount(amount);
              },
            ),
          ),
        ),
      ],
    );
  }
}
