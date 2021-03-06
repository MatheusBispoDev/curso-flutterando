import 'package:cursofluterrando/conversor/models/currency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel>? items;
  final CurrencyModel? isSelectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel? model) onChanged;

  const CurrencyBox({
    Key? key,
    required this.items,
    required this.controller,
    required this.onChanged,
    required this.isSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              iconEnabledColor: Colors.amber,
              isExpanded: true,
              value: isSelectedItem,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              items: items!
                  .map((elementos_items) => DropdownMenuItem(
                      value: elementos_items,
                      child: Text(elementos_items.name)))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 3,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber)),
            ),
          ),
        ),
      ],
    );
  }
}
