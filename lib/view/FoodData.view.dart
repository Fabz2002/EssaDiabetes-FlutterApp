import 'package:first_app_flutter/common/models/comida.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class FoodInfo extends StatefulWidget {
  final Items items;
  const FoodInfo({Key? key, required this.items}) : super(key: key);

  @override
  State<FoodInfo> createState() => _FoodInfoState();
}

class _FoodInfoState extends State<FoodInfo> {
  int? selectedPortion = 1;
  String? addTo = "desayuno";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              ImgContainer(widget: widget),
              Positioned(
                  top: 320,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 20,
                      top: 30,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleFoodInfo(widget: widget),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween, // Para dar espacio uniforme entre los elementos
                              children: [
                                _buildColumn(widget.items.kcal ?? 0, 'Calorías',
                                    "kcal", selectedPortion ?? 0),
                                _buildColumn(widget.items.prote ?? 0,
                                    'Proteínas', "g", selectedPortion ?? 0),
                                _buildColumn(widget.items.carbs ?? 0,
                                    'Carbohidratos', "g", selectedPortion ?? 0),
                                _buildColumn(widget.items.grasas ?? 0, 'Grasas',
                                    "g", selectedPortion ?? 0),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 35,
                              child: Text(
                                "Descripción",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.items.desc ?? '',
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Número de porciones',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(width: 50),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: 85, // define width here
                                    height: 45, // define height here
                                    child: DropdownButton<int>(
                                      isExpanded:
                                          true, // ensure that the dropdown button expands to fill the container
                                      value: selectedPortion,
                                      items: [1, 2, 3].map((int value) {
                                        return DropdownMenuItem<int>(
                                          value: value,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('$value'),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (int? newValue) {
                                        setState(() {
                                          selectedPortion = newValue;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const ButtonAddToListFood()
                          ]),
                    ),
                  ))
            ],
          )),
    );
  }

  Widget _buildColumn(int value, String name, String letra, int porcion) {
    int texto = value * porcion;
    return Column(
      children: [
        Text("$texto $letra",
            style:
                const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
        Text(name, style: const TextStyle(fontSize: 12.0)),
      ],
    );
  }
}

class ButtonAddToListFood extends StatelessWidget {
  const ButtonAddToListFood({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Acción al pulsar el botón
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor, // Color del botón
        ),
        child: const Text('Agregar'),
      ),
    );
  }
}

class TitleFoodInfo extends StatelessWidget {
  const TitleFoodInfo({
    super.key,
    required this.widget,
  });

  final FoodInfo widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          // Añade esta línea
          child: Text(
            widget.items.titulo ?? '',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start, // Centra el texto
            maxLines: 2, // Limita el texto a dos líneas
            overflow: TextOverflow
                .ellipsis, // Añade puntos suspensivos si el texto excede de las dos líneas
          ),
        ),
      ],
    );
  }
}

class ImgContainer extends StatelessWidget {
  const ImgContainer({
    super.key,
    required this.widget,
  });

  final FoodInfo widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      child: Container(
          width: double.maxFinite,
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.items.img ?? 'uri'),
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
