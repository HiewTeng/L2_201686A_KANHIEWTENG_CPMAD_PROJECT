import 'package:firebase_redo/services/firebaseauth_service.dart';
import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool signUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('QRestaurant Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'abc@gmail.com'),
              //   labelText: "Email",
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
              obscureText: true,
              // decoration: InputDecoration(
              //   labelText: "Password",
              // ),
            ),
          ),
          RaisedButton(
            onPressed: () async {
              if (signUp) {
                var newuser = await FirebaseAuthService().signUp(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );
                if (newuser != null) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                }
              } else {
                var reguser = await FirebaseAuthService().signIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                );

                if (reguser != null) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                }
              }
            },
            child: signUp ? Text("Sign Up") : Text("Sign In"),
          ),
          OutlineButton(
            onPressed: () {
              setState(() {
                signUp = !signUp;
              });
            },
            child: signUp
                ? Text("Have an account? Sign In")
                : Text("Create an account"),
          )
        ],
      ),
    );
  }
}

// import 'package:firebase_redo/services/firebaseauth_service.dart';
// import 'package:flutter/material.dart';
// import 'MyHomePage.dart';
// // import 'home_page.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   bool signUp = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text('QRestaurant'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 labelText: "Email",
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: "Password",
//               ),
//             ),
//           ),
//           RaisedButton(
//             onPressed: () async {
//               if (signUp) {
//                 var newuser = await FirebaseAuthService().signUp(
//                   email: emailController.text.trim(),
//                   password: passwordController.text.trim(),
//                 );
//                 // if (newuser != null) {
//                 //   Navigator.of(context).pushReplacement(
//                 //       MaterialPageRoute(builder: (context) => HomePage()));
//                 // }
//                 if (newuser != null) {
//                   Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (context) => MyHomePage()));
//                 }
//               } else {
//                 var reguser = await FirebaseAuthService().signIn(
//                   email: emailController.text.trim(),
//                   password: passwordController.text.trim(),
//                 );

//                 // if (reguser != null) {
//                 //   Navigator.of(context).pushReplacement(
//                 //       MaterialPageRoute(builder: (context) => HomePage()));
//                 // }

//                 if (reguser != null) {
//                   Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(builder: (context) => MyHomePage()));
//                 }
//               }
//             },
//             child: signUp ? Text("Register") : Text("Login"),
//           ),
//           OutlineButton(
//             onPressed: () {
//               setState(() {
//                 signUp = !signUp;
//               });
//             },
//             child: signUp
//                 ? Text("Have an account? Sign In")
//                 : Text("Create an account"),
//           )
//         ],
//       ),
//     );
//   }
// }
