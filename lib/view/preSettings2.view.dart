import 'package:flutter/material.dart';

import 'package:first_app_flutter/Routes/routes.dart';
import 'package:first_app_flutter/widgets/agePicker.widget.dart';
import 'package:first_app_flutter/widgets/genderSelection.widget.dart';
import 'package:first_app_flutter/widgets/weightInput.widget.dart';

class PreSettings2View extends StatefulWidget {
  const PreSettings2View({Key? key}) : super(key: key);

  @override
  State<PreSettings2View> createState() => _PreSettings2ViewState();
}

class _PreSettings2ViewState extends State<PreSettings2View> {
  int _selectedButtonIndex = 0;
  String? selectedGender;
  void _selectButton(int index) {
    setState(() {
      _selectedButtonIndex = index;
    });
  }

  bool isGenderSelected() {
    return selectedGender != null;
  }

  double? enteredWeight;
  double? enteredHeight;
  final double minHeight = 120; // Minimum height in centimeters

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Comidas al día",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildButtonRow(0, 2),
                      _buildButtonRow(1, 3),
                      _buildButtonRow(2, 4),
                      _buildButtonRow(3, 5),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Edad",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const AgePicker(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Género",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                GenderSelectionWidget(
                  onGenderSelected: (gender) {
                    setState(() {
                      selectedGender = gender;
                    });
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Peso",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                WeightInputWidget(
                  onChanged: (weight) {
                    setState(() {
                      enteredWeight = weight;
                    });
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Altura",
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                HeightInputWidget(
                  onChanged: (height) {
                    setState(() {
                      enteredHeight = height;
                    });
                  },
                  minHeight: minHeight,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 50.0),
                  width: MediaQuery.of(context).size.width * .4,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[500],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                    child: TextButton(
                      onPressed: () {
                        if (isGenderSelected() &&
                            enteredWeight != null &&
                            enteredWeight! >= 35 &&
                            enteredHeight != null &&
                            enteredHeight! >= minHeight) {
                          Navigator.pushNamed(context, Routes.Homepage);
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'Error',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Por favor, verifica los siguientes criterios antes de continuar:',
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                    if (!isGenderSelected()) Text('- Selecciona un género.'),
                                    if (enteredWeight == null || enteredWeight! < 35)
                                      Text('- Ingresa un peso válido mayor que 35.'),
                                    if (enteredHeight == null || enteredHeight! < minHeight)
                                      Text('- Ingresa una altura válida mayor o igual a $minHeight.'),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Aceptar'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
                        "Acceder",
                        style: TextStyle(
                          color: kDefaultIconLightColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonRow(int index, int number) {
    final isSelected = _selectedButtonIndex == index;

    return TextButton(
      onPressed: () {
        _selectButton(index);
      },
      style: TextButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : const Color.fromARGB(255, 219, 219, 219),
        shape: const CircleBorder(),
      ),
      child: Text(
        '$number',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}

class HeightInputWidget extends StatefulWidget {
  final ValueChanged<double>? onChanged;
  final double minHeight;

  const HeightInputWidget({Key? key, this.onChanged, this.minHeight = 0}) : super(key: key);

  @override
  _HeightInputWidgetState createState() => _HeightInputWidgetState();
}

class _HeightInputWidgetState extends State<HeightInputWidget> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textEditingController,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        final double? parsedValue = double.tryParse(value);
        if (parsedValue != null) {
          widget.onChanged?.call(parsedValue);
        }
      },
      decoration: InputDecoration(
        hintText: 'Altura (cm)',
        errorText: _validateInput() ? 'Altura mínima: ${widget.minHeight} cm' : null,
      ),
    );
  }

  bool _validateInput() {
    if (_textEditingController.text.isNotEmpty) {
      final double? parsedValue = double.tryParse(_textEditingController.text);
      if (parsedValue == null || parsedValue < widget.minHeight) {
        return true;
      }
    }
    return false;
  }
}
