import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/idprovider.dart';
import '../widgets/drawerContainer.widget.dart';
import '../widgets/header.widget.dart';

class PlanificacionComidas extends StatefulWidget {
  const PlanificacionComidas({Key? key}) : super(key: key);
  @override
  State<PlanificacionComidas> createState() => _PlanificacionComidasState();
}

class _PlanificacionComidasState extends State<PlanificacionComidas> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? desayunoSeleccionado;
  String? almuerzoSeleccionado;
  String? cenaSeleccionada;
  Future<List<String>> obtenerComidas() async {
    final idProvider = Provider.of<IdProvider>(context, listen: false);
    final DocumentReference docRef =
        FirebaseFirestore.instance.collection('Users').doc(idProvider.id);
    final DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      final List<Map<String, dynamic>> comidas =
          List<Map<String, dynamic>>.from(docSnapshot['comidas']);
      final List<String> titulosComidas =
          comidas.map((comida) => comida['nombre'] as String).toList();

      return titulosComidas;
    } else {
      // ignore: avoid_print
      print('No existe el documento');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Form(
          child: FutureBuilder<List<String>>(
            future: obtenerComidas(),
            builder:
                (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Header(
                      imgUser: 'assets/images/default.png',
                      scaffoldKey: _scaffoldKey,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'PLANIFICACIÓN DEL DÍA',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: const Text('Desayuno:'),
                                flex: 1,
                              ),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: desayunoSeleccionado,
                                  hint: const Text('Selecciona Desayuno'),
                                  isExpanded:
                                      true, // Para que el DropdownButton tome todo el espacio disponible
                                  items: snapshot.data!.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      desayunoSeleccionado = newValue;
                                    });
                                  },
                                ),
                                flex: 2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: const Text('Almuerzo:'),
                                flex: 1,
                              ),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: almuerzoSeleccionado,
                                  hint: const Text('Selecciona Almuerzo'),
                                  isExpanded: true,
                                  items: snapshot.data!.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      almuerzoSeleccionado = newValue;
                                    });
                                  },
                                ),
                                flex: 2,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: const Text('Cena:'),
                                flex: 1,
                              ),
                              Expanded(
                                child: DropdownButton<String>(
                                  value: cenaSeleccionada,
                                  hint: const Text('Selecciona Cena'),
                                  isExpanded: true,
                                  items: snapshot.data!.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      cenaSeleccionada = newValue;
                                    });
                                  },
                                ),
                                flex: 2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Guardar'),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
      drawer: DrawerForInfo(scaffoldKey: _scaffoldKey),
    );
  }
}
