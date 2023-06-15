import 'package:first_app_flutter/view/caloriesCalculator.view.dart';
import 'package:first_app_flutter/view/foodForm.view.dart';
import 'package:first_app_flutter/view/login.view.dart';
import 'package:first_app_flutter/view/preSettings.view.dart';
import 'package:first_app_flutter/view/preSettings2.view.dart';
import 'package:first_app_flutter/view/userProfile.view.dart';
import 'package:flutter/material.dart';
import 'package:first_app_flutter/Routes/routes.dart';
import 'package:first_app_flutter/view/home.view.dart';

abstract class Pages {
  static Map<String, Widget Function(BuildContext)> route = {
    Routes.Loginpage: (BuildContext context) => const LoginView(),
    Routes.PresettingPage: (BuildContext context) => PreSettingsView(
        id: ModalRoute.of(context)!.settings.arguments as String),
    Routes.Presetting2Page: (BuildContext context) {
      final String id = ModalRoute.of(context)!.settings.arguments as String;
      return PreSettings2View(id: id);
    },
    Routes.Homepage: (BuildContext context) {
      final String id = ModalRoute.of(context)!.settings.arguments as String;
      return HomeView(id: id);
    },
    Routes.UserProfilePage: (BuildContext context) => const UserProfileView(),
    Routes.FoodFormPage: (BuildContext context) => const FoodForm(),
    Routes.CaloriesCalculatorPage: (BuildContext context) =>
        const CaloriesCalculatorView(),
  };
}
