import 'package:first_app_flutter/widgets/categoryCard.widget.dart';
import 'package:flutter/material.dart';
import 'package:first_app_flutter/Routes/routes.dart';
import 'package:first_app_flutter/theme.dart';
import 'package:first_app_flutter/widgets/drawerContainer.widget.dart';
import 'package:first_app_flutter/widgets/header.widget.dart';
import 'package:first_app_flutter/widgets/healthyFoodList.widget.dart';
import 'package:first_app_flutter/widgets/welcomeMessageContainer.widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          const Expanded(child: HealthyFoodList())
        ],
      )),
      drawer: DrawerForInfo(
        scaffoldKey: _scaffoldKey,
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
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
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
