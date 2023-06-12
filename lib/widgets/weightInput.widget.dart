import 'package:flutter/material.dart';

class WeightInputWidget extends StatefulWidget {
  final Function(double)? onChanged;
  final double minWeight;
  final double maxWeight;

  const WeightInputWidget({Key? key, this.onChanged, this.minWeight = 0, this.maxWeight = 180})
      : super(key: key);

  @override
  State<WeightInputWidget> createState() => _WeightInputWidgetState();
}

class _WeightInputWidgetState extends State<WeightInputWidget> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 27, left: 25, bottom: 12),
      child: TextField(
        controller: textEditingController,
        keyboardType: TextInputType.number,
        onChanged: (value) {
          final double? parsedValue = double.tryParse(value);
          if (parsedValue != null) {
            widget.onChanged?.call(parsedValue);
          }
        },
        decoration: InputDecoration(
          hintText: 'Peso (kg)',
          errorText:
              _validateInput() ? 'Peso mínimo: ${widget.minWeight} kg, máximo: ${widget.maxWeight} kg ' : null,
        ),
      ),
    );
  }

  bool _validateInput() {
    if (textEditingController.text.isNotEmpty) {
      final double? parsedValue = double.tryParse(textEditingController.text);
      if (parsedValue == null || 
      parsedValue < widget.minWeight ||
      parsedValue > widget.maxWeight) {
        return true;
      }
    }
    return false;
  }
}
