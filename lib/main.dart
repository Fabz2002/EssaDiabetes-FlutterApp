import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:first_app_flutter/view/Splash.view.dart';
import 'Routes/pages.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "EssaDiabetes",
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const SplashView(),
      routes: Pages.route,
    );
  }
}
