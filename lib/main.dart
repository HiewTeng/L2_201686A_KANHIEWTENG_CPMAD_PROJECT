import 'package:firebase_redo/pages/LoginPage.dart';
import 'package:firebase_redo/pages/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/StartPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRestaurant',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => MyHomePage(
              id: null,
            ),
      },
      home: SplashScreen(),
    );
  }
}
