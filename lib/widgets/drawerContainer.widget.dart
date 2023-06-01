import 'package:first_app_flutter/Routes/routes.dart';
import 'package:first_app_flutter/theme.dart';
import 'package:flutter/material.dart';

class DrawerForInfo extends StatelessWidget {
  const DrawerForInfo({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              _scaffoldKey.currentState?.openEndDrawer();
              Navigator.pushNamed(context, Routes.Homepage);
            },
          ),
          ListTile(
            title: const Text('Registro de Alimentos'),
            onTap: () {
              _scaffoldKey.currentState?.openEndDrawer();
              Navigator.pushNamed(context, Routes.FoodFormPage);
            },
          ),
          ListTile(
            title: const Text('Calculadora de Calorias'),
            onTap: () {
              _scaffoldKey.currentState?.openEndDrawer();
              Navigator.pushNamed(context, Routes.CaloriesCalculatorPage);
            },
          ),
          ListTile(
            title: const Text('Configuración'),
            onTap: () {
              _scaffoldKey.currentState?.openEndDrawer();
              Navigator.pushNamed(context, Routes.UserProfilePage);
            },
          ),
        ],
      ),
    );
  }
}
