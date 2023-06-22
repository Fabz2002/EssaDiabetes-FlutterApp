import 'package:first_app_flutter/theme.dart';
import 'package:first_app_flutter/widgets/drawerContainer.widget.dart';
import 'package:first_app_flutter/widgets/header.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CaloriesCalculatorView extends StatefulWidget {
  const CaloriesCalculatorView({Key? key}) : super(key: key);

  @override
  State<CaloriesCalculatorView> createState() => _CaloriesCalculatorViewState();
}

class _CaloriesCalculatorViewState extends State<CaloriesCalculatorView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  int? selectedAge;
  String? selectedGender;
  String? weight;
  String? height;
  double nivelActividad = 1.2;
  double calculatedResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(
                  imgUser: 'assets/images/default.png',
                  scaffoldKey: _scaffoldKey,
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      'Calculadora de Calorías',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Container(
                        color: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 11,
                        ),
                        child: const Text(
                          'Edad:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButton<int>(
                          value: selectedAge,
                          hint: const Text('Selecciona tu edad'),
                          onChanged: (newValue) {
                            setState(() {
                              selectedAge = newValue;
                            });
                          },
                          items: List.generate(83, (index) => index + 18)
                              .map(
                                (age) => DropdownMenuItem<int>(
                                  value: age,
                                  child: Text('$age años'),
                                ),
                              )
                              .toList(),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: kPrimaryColor),
                          iconSize: 24,
                          isExpanded: true,
                          underline: Container(
                            height: 1,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Container(
                        color: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 8,
                        ),
                        child: const Text(
                          'Altura:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (newValue) {
                              setState(() {
                                height = newValue;
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'Ingrese Altura (cm)',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: kPrimaryColor, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: kPrimaryColor, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Container(
                        color: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 12,
                        ),
                        child: const Text(
                          'Peso:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (newValue) {
                              setState(() {
                                weight = newValue;
                              });
                            },
                            decoration: const InputDecoration(
                              hintText: 'Ingrese Peso (kg)',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: kPrimaryColor, width: 1.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: kPrimaryColor, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Container(
                        color: kPrimaryColor,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 12.5,
                        ),
                        child: const Text(
                          'Sexo:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: DropdownButton<String>(
                          value: selectedGender,
                          hint: const Text('Selecciona tu sexo'),
                          onChanged: (newValue) {
                            setState(() {
                              selectedGender = newValue;
                            });
                          },
                          items: ['Masculino', 'Femenino']
                              .map(
                                (gender) => DropdownMenuItem<String>(
                                  value: gender,
                                  child: Text(gender),
                                ),
                              )
                              .toList(),
                          icon: const Icon(Icons.arrow_drop_down,
                              color: kPrimaryColor),
                          iconSize: 24,
                          isExpanded: true,
                          underline: Container(
                            height: 1,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Table(
                    border: TableBorder.all(color: kPrimaryColor, width: 1.0),
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              color: kPrimaryColor,
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                'NIVEL DE ACTIVIDAD',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              color: kPrimaryColor,
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                'EJEMPLOS',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.zero,
                              child: RadioListTile(
                                visualDensity: VisualDensity.compact,
                                title: const Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      'Poco o ningún ejercicio',
                                      style: TextStyle(fontSize: 13),
                                    )),
                                contentPadding: EdgeInsets.zero,
                                value: 1.2,
                                groupValue: nivelActividad,
                                onChanged: (value) {
                                  setState(() {
                                    nivelActividad = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.zero,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/sentado.png',
                                    width: 45,
                                    height: 45,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Sedentario',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.zero,
                              child: RadioListTile(
                                visualDensity: VisualDensity.compact,
                                title: const Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      'Ejercicio ligero',
                                      style: TextStyle(fontSize: 13),
                                    )),
                                contentPadding: EdgeInsets.zero,
                                value: 1.375,
                                groupValue: nivelActividad,
                                onChanged: (value) {
                                  setState(() {
                                    nivelActividad = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.zero,
                              child: Row(
                                children: [
                                  const SizedBox(width: 13),
                                  Image.asset(
                                    'assets/images/jardinero.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    '1-3 D x S',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.zero,
                              child: RadioListTile(
                                visualDensity: VisualDensity.compact,
                                title: const Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      'Ejercicio moderado',
                                      style: TextStyle(fontSize: 13),
                                    )),
                                contentPadding: EdgeInsets.zero,
                                value: 1.55,
                                groupValue: nivelActividad,
                                onChanged: (value) {
                                  setState(() {
                                    nivelActividad = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.zero,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    'assets/images/trotar.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    '3-5 D x S',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.zero,
                              child: RadioListTile(
                                visualDensity: VisualDensity.compact,
                                title: const Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      'Ejercicio fuerte',
                                      style: TextStyle(fontSize: 13),
                                    )),
                                contentPadding: EdgeInsets.zero,
                                value: 1.725,
                                groupValue: nivelActividad,
                                onChanged: (value) {
                                  setState(() {
                                    nivelActividad = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.zero,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    'assets/images/trotar.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    '6-7 D x S',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.zero,
                              child: RadioListTile(
                                visualDensity: VisualDensity.compact,
                                title: const Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      'Ejercicio muy fuerte',
                                      style: TextStyle(fontSize: 13),
                                    )),
                                contentPadding: EdgeInsets.zero,
                                value: 1.9,
                                groupValue: nivelActividad,
                                onChanged: (value) {
                                  setState(() {
                                    nivelActividad = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              padding: EdgeInsets.zero,
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/nadar.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                  const SizedBox(width: 1),
                                  const Text(
                                    '2 veces al Día',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (selectedAge == null ||
                          weight == null ||
                          height == null ||
                          selectedGender == null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Campos Incompletos',
                                  style: TextStyle(
                                    fontSize: 21,
                                    color: kPrimaryColor,
                                  )),
                              content: const Text(
                                  'Por favor, completa todos los campos.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Aceptar',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: kPrimaryColor,
                                      )),
                                ),
                              ],
                            );
                          },
                        );
                        return;
                      }

                      calculateCalories();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  child: const Text('Calcular'),
                ),
                const SizedBox(height: 5),
                Text(
                  'Resultado: $calculatedResult',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: DrawerForInfo(scaffoldKey: _scaffoldKey),
    );
  }

  void calculateCalories() {
    final double age = selectedAge!.toDouble();
    final double parsedWeight = double.parse(weight!);
    final double parsedHeight = double.parse(height!);

    double result;
    if (selectedGender == 'Masculino') {
      result = (5 + (5 * parsedWeight)) +
          ((6.25 * parsedHeight) - (5 * age)) * nivelActividad;
    } else {
      result = ((9 * parsedWeight)) +
          ((6.25 * parsedHeight) - (5 * age) - 161) * nivelActividad;
    }

    setState(() {
      calculatedResult = result;
    });
  }
}
