import 'package:first_app_flutter/Routes/routes.dart';
import 'package:first_app_flutter/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/idprovider.dart';

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
              final idProvider =
                  Provider.of<IdProvider>(context, listen: false);
              Navigator.pushNamed(context, Routes.Homepage,
                  arguments: idProvider.id);
            },
          ),
          ListTile(
            title: const Text('Registro de Alimentos'),
            onTap: () {
              _scaffoldKey.currentState?.openEndDrawer();
              final idProvider =
                  Provider.of<IdProvider>(context, listen: false);
              Navigator.pushNamed(context, Routes.FoodFormPage,
                  arguments: idProvider.id);
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
