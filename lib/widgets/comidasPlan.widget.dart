// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/comida/comida_bloc.dart';

class ComidasPlan extends StatefulWidget {
  final String id;

  const ComidasPlan({Key? key, required this.id}) : super(key: key);

  @override
  State<ComidasPlan> createState() => _ComidasPlanState();
}

class _ComidasPlanState extends State<ComidasPlan> {
  late String id;
  String ruta = '';
  List<Map<dynamic, dynamic>> lists = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: BlocBuilder<ComidaBloc, ComidaState>(
            builder: (context, state) {
              return state.map(
                initial: (_) {
                  return const Center(child: CircularProgressIndicator());
                },
                message: (s) {
                  return Container();
                },
                loadSuccess: (s) {
                  return Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                            List.generate(s.data.desayuno.length, (index) {
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, top: 20 / 2, bottom: 10 * 2),
                              width: MediaQuery.of(context).size.width * 0.4,
                              height: MediaQuery.of(context).size.width * 0.6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: const Color.fromRGBO(165, 195, 223, 1),
                                image: DecorationImage(
                                  image:
                                      NetworkImage(s.data.desayuno[index].img!),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.3),
                                    BlendMode.darken,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      s.data.desayuno[index].titulo ?? "",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      "${s.data.desayuno[index].kcal} calorias",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  );
                },
              );
            },
          )),
    );
  }
}
