import 'package:flutter/cupertino.dart';

import '../Static/ages.dart';

class AgePicker extends StatefulWidget {
  final Function(int) onAgeSelected;

  const AgePicker({Key? key, required this.onAgeSelected}) : super(key: key);

  @override
  State<AgePicker> createState() => _AgePickerState();
}

class _AgePickerState extends State<AgePicker> {
  late FixedExtentScrollController scrollController;
  int index = 4;

  @override
  void initState() {
    super.initState();
    scrollController = FixedExtentScrollController(initialItem: index);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 40, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              items[index],
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
            ),
          ),
          CupertinoButton.filled(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text("Cambiar Edad"),
            onPressed: () {
              scrollController.dispose();
              scrollController =
                  FixedExtentScrollController(initialItem: index);
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  actions: [
                    buildPicker(),
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: const Text("Cancelar"),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildPicker() => SizedBox(
        height: 350,
        child: CupertinoPicker(
          scrollController: scrollController,
          itemExtent: 64,
          selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
            background: CupertinoColors.activeBlue.withOpacity(0.2),
          ),
          children: List.generate(items.length, (index) {
            final item = items[index];
            return Builder(
              builder: (BuildContext context) {
                final isSelected = this.index == index;
                final color =
                    isSelected ? CupertinoColors.black : CupertinoColors.black;
                return Center(
                  child:
                      Text(item, style: TextStyle(color: color, fontSize: 32)),
                );
              },
            );
          }),
          onSelectedItemChanged: (index) {
            if (index >= 0 && index < items.length) {
              setState(() {
                this.index = index;
              });
              final item = items[index];
              widget.onAgeSelected(int.parse(item));
            }
          },
        ),
      );
}
