import 'package:first_app_flutter/Provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:first_app_flutter/Routes/routes.dart';
import 'package:first_app_flutter/widgets/agePicker.widget.dart';
import 'package:first_app_flutter/widgets/genderSelection.widget.dart';
import 'package:first_app_flutter/widgets/weightInput.widget.dart';
import 'package:first_app_flutter/widgets/heightInput.widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class PreSettings2View extends StatefulWidget {
  final String id;
  const PreSettings2View({Key? key, required this.id}) : super(key: key);

  @override
  State<PreSettings2View> createState() => _PreSettings2ViewState();
}

class _PreSettings2ViewState extends State<PreSettings2View> {
  late String id;
  late int selectedAge = 18;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    id = widget.id;
  }

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
  final double minHeight = 120;
  final double minWeight = 35;
  final double maxWeight = 180;
  final double maxHeight = 210;

  Future<void> saveDataToDatabase() async {
    UserService userService = Provider.of<UserService>(context, listen: false);
    final db = FirebaseFirestore.instance;
    final documentRef = db.collection("Users").doc(id);

    await documentRef.update({
      'genero': selectedGender,
      'peso': enteredWeight,
      'altura': enteredHeight,
      'edad': selectedAge,
    });

    try {
      // Llama a fetchUser.
      await userService.fetchUser(id);
      return;
    } catch (e) {
      if (e is FirebaseException && e.code == 'not-found') {
        // Si no se encuentra el documento, muestra un mensaje de error.
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('El usuario con ID $id no se encuentra.')),
        );
      }
    }
  }

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
                      "Edad",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                AgePicker(
                  onAgeSelected: (age) {
                    setState(() {
                      selectedAge = age;
                    });
                  },
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Género",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
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
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                WeightInputWidget(
                  onChanged: (weight) {
                    setState(() {
                      enteredWeight = weight;
                    });
                  },
                  minWeight: minWeight,
                  maxWeight: maxWeight,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Altura",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
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
                  maxHeight: maxHeight,
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
                      onPressed: () async {
                        if (isGenderSelected() &&
                            enteredWeight != null &&
                            enteredWeight! >= minWeight &&
                            enteredWeight! <= maxWeight &&
                            enteredHeight != null &&
                            enteredHeight! >= minHeight &&
                            enteredHeight! <= maxHeight) {
                          await saveDataToDatabase();

                          // ignore: use_build_context_synchronously
                          Navigator.pushNamed(context, Routes.Homepage,
                              arguments: id);
                        } else {
                          // ignore: use_build_context_synchronously
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
                                    const Text(
                                      'Por favor, verifica los siguientes criterios antes de continuar:',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    if (!isGenderSelected())
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    const Text(
                                      'Selecciona un género.',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    if (enteredWeight == null ||
                                        enteredWeight! < minWeight ||
                                        enteredWeight! > maxWeight)
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    Text(
                                      'Peso válido mayor o igual a $minWeight y menor o igual a $maxWeight.',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    if (enteredHeight == null ||
                                        enteredHeight! < minHeight ||
                                        enteredHeight! > maxHeight)
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    Text(
                                      'Altura válida mayor o igual a $minHeight y menor o igual a $maxHeight.',
                                      style: const TextStyle(fontSize: 14),
                                    ),
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
        backgroundColor:
            isSelected ? Colors.blue : const Color.fromARGB(255, 219, 219, 219),
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
