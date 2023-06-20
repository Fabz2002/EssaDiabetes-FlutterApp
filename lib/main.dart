import 'package:firebase_core/firebase_core.dart';
import 'package:first_app_flutter/core/helper/provider.dart';
import 'package:flutter/material.dart';
import 'package:first_app_flutter/view/splash.view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Provider/idprovider.dart';
import 'Routes/pages.dart';
import 'core/ioc/injectable.dart';
import 'firebase_options.dart';
import 'Provider/provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiBlocProvider(
    providers: BlocProviderHelper().providres,
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<IdProvider>(create: (_) => IdProvider()),
          ChangeNotifierProvider<UserService>(create: (_) => UserService())
        ],
        builder: (context, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "EssaDiabetes",
            theme: ThemeData(fontFamily: 'Poppins'),
            home: const SplashView(),
            routes: Pages.route,
          );
        });
  }
}
