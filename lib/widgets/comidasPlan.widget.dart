// ignore_for_file: avoid_print

import 'package:first_app_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/comida/comida_bloc.dart';
import 'FoodRow.widget.dart';

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
                  return Column(
                    children: [
                      FoodRow(title: 'Desayunos', itemsList: s.data.desayuno),
                      FoodRow(title: 'Almuerzos', itemsList: s.data.almuerzo),
                      FoodRow(title: 'Cenas', itemsList: s.data.cena),
                    ],
                  );
                },
              );
            },
          )),
    );
  }
}

class TitleKindsFood extends StatelessWidget {
  final String title;
  const TitleKindsFood({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
