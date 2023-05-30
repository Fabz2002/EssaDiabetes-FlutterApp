import 'package:first_app_flutter/data/ages.dart';
import 'package:flutter/cupertino.dart';

class AgePicker extends StatefulWidget {
  const AgePicker({super.key});

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
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              items[index],
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(
            width: 24,
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
            final isSelected = this.index == index;
            final item = items[index];
            final color =
                isSelected ? CupertinoColors.activeBlue : CupertinoColors.black;
            return Center(
              child: Text(item, style: TextStyle(color: color, fontSize: 32)),
            );
          }),
          onSelectedItemChanged: (index) {
            setState(() => this.index = index);

            final item = items[index];
            // ignore: avoid_print
            print('item:$item');
          },
        ),
      );
}