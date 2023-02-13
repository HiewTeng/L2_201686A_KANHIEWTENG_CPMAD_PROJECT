import 'package:firebase_redo/pages/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'pages/HomePage.dart';
import 'pages/StartPage.dart';
import 'pages/login_page.dart';

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
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => MyHomePage(),
      },
      home: SplashScreen(),
      // home: LoginPage(),
    );
  }
}

// import 'dart:js';

// import 'package:firebase_redo/pages/MyHomePage.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';

// import 'pages/StartPage.dart';
// import 'pages/login_page.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   return runApp(
//     ChangeNotifierProvider(
//       create: (context) => MyHomePage(id: null),
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,

//       title: 'QRestaurant',
//       routes: {
//         '/login': (context) => LoginPage(),
//         '/home': (context) => MyHomePage(),
//       },
//       home: SplashScreen(),
//       // home: LoginPage(),
//     );
//   }
// }
