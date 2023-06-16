import 'dart:developer';

import 'package:first_app_flutter/widgets/categoryCard.widget.dart';
import 'package:first_app_flutter/widgets/comidasPlan.widget.dart';
import 'package:flutter/material.dart';
import 'package:first_app_flutter/Routes/routes.dart';
import 'package:first_app_flutter/theme.dart';
import 'package:first_app_flutter/widgets/drawerContainer.widget.dart';
import 'package:first_app_flutter/widgets/header.widget.dart';
import 'package:first_app_flutter/widgets/healthyFoodList.widget.dart';
import 'package:first_app_flutter/widgets/welcomeMessageContainer.widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'comida/comida_bloc.dart';

class HomeView extends StatefulWidget {
  final String id;
  const HomeView({Key? key, required this.id}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String id;
  late ComidaBloc _comidaBloc;

  @override
  void initState() {
    _comidaBloc = context.read<ComidaBloc>();
    _comidaBloc.add(ComidaEvent.getComida(widget.id));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    id = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ComidaBloc, ComidaState>(listener: (c, state) {
          if (state is MessageGetComida) {
            log(state.message.toString());
          }
        })
      ],
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Column(
            children: [
              Header(
                imgUser: 'assets/images/default.png',
                scaffoldKey: _scaffoldKey,
              ),
              const SizedBox(
                height: 50,
              ),
              const WelcomeMessageContainer(),
              const CategoriesListScroll(),
              const HealthyFoodTitle(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ComidasPlan(id: id),
                      const HealthyFoodList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: DrawerForInfo(
          scaffoldKey: _scaffoldKey,
        ),
      ),
    );
  }
}

class CategoriesListScroll extends StatelessWidget {
  const CategoriesListScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: Row(children: [
          CategoryCard(
              categoryTitle: "Registro",
              categorySubTitle: "Alimentos",
              img: "assets/images/registroAlimentos.jpg",
              press: () {
                Navigator.pushNamed(context, Routes.FoodFormPage);
              }),
          CategoryCard(
              categoryTitle: "Calculadora",
              categorySubTitle: "Calorias",
              img: "assets/images/calculadoraCarbohidratos.jpg",
              press: () {
                Navigator.pushNamed(context, Routes.CaloriesCalculatorPage);
              }),
          CategoryCard(
              categoryTitle: "Planificación",
              categorySubTitle: "Comida",
              img: "assets/images/planificacionAlimentos.jpg",
              press: () {})
        ]),
      ),
    );
  }
}

class HealthyFoodTitle extends StatelessWidget {
  const HealthyFoodTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: const [
          Text(
            "Alimentos Saludables",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
