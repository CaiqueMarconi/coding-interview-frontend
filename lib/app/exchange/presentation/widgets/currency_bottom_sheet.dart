import 'package:coding_interview_frontend/app/exchange/domain/entities/currency_entity.dart';
import 'package:flutter/material.dart';

class CurrencyBottomSheet extends StatelessWidget {
  final List<CurrencyEntity> items;
  final CurrencyEntity? selected;
  final bool isFrom;
  final void Function(CurrencyEntity) onSelect;

  const CurrencyBottomSheet({
    super.key,
    this.selected,
    required this.items,
    required this.isFrom,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(size.width * 0.05),
        ),
      ),
      padding: EdgeInsets.only(top: size.height * 0.016),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 4,
            width: 48,
            margin: EdgeInsets.only(bottom: size.height * 0.02),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Text(
            isFrom ? 'CRYPTO' : 'FIAT',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: items.length,
              itemBuilder: (_, index) {
                final item = items[index];

                return ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    onSelect(item);
                  },
                  contentPadding: const EdgeInsets.symmetric(vertical: 4),
                  leading: Padding(
                    padding: EdgeInsets.only(right: size.width * 0.02),
                    child: Image.asset(item.iconPath!, scale: 2.8),
                  ),
                  title: Text(
                    item.id,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${item.name} (${item.symbol})'),
                  trailing: Radio(
                    value: item.id,
                    groupValue: selected?.id,
                    onChanged: (v) {},
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
