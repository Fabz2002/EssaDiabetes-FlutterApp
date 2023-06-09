import 'package:flutter/material.dart';

class HeightInputWidget extends StatefulWidget {
  final Function(double)? onChanged;
  final double minHeight;

  const HeightInputWidget({Key? key, this.onChanged, this.minHeight = 0})
      : super(key: key);

  @override
  State<HeightInputWidget> createState() => _HeightInputWidgetState();
}

class _HeightInputWidgetState extends State<HeightInputWidget> {
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
          hintText: 'Altura (cm)',
          errorText:
              _validateInput() ? 'Altura mínima: ${widget.minHeight} cm' : null,
        ),
      ),
    );
  }

  bool _validateInput() {
    if (textEditingController.text.isNotEmpty) {
      final double? parsedValue = double.tryParse(textEditingController.text);
      if (parsedValue == null || parsedValue < widget.minHeight) {
        return true;
      }
    }
    return false;
  }
}
