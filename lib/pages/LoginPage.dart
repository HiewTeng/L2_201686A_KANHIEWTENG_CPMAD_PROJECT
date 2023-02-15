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
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Password'),
              obscureText: true,
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

// // import 'package:firebase_redo/services/firebaseauth_service.dart';
// // import 'package:flutter/material.dart';
// // import 'MyHomePage.dart';
// // // import 'home_page.dart';

// // class LoginPage extends StatefulWidget {
// //   @override
// //   State<LoginPage> createState() => _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage> {
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();

// //   bool signUp = true;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         automaticallyImplyLeading: false,
// //         title: Text('QRestaurant'),
// //       ),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         mainAxisSize: MainAxisSize.max,
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.all(12.0),
// //             child: TextField(
// //               controller: emailController,
// //               decoration: InputDecoration(
// //                 labelText: "Email",
// //               ),
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(12.0),
// //             child: TextField(
// //               controller: passwordController,
// //               obscureText: true,
// //               decoration: InputDecoration(
// //                 labelText: "Password",
// //               ),
// //             ),
// //           ),
// //           RaisedButton(
// //             onPressed: () async {
// //               if (signUp) {
// //                 var newuser = await FirebaseAuthService().signUp(
// //                   email: emailController.text.trim(),
// //                   password: passwordController.text.trim(),
// //                 );
// //                 // if (newuser != null) {
// //                 //   Navigator.of(context).pushReplacement(
// //                 //       MaterialPageRoute(builder: (context) => HomePage()));
// //                 // }
// //                 if (newuser != null) {
// //                   Navigator.of(context).pushReplacement(
// //                       MaterialPageRoute(builder: (context) => MyHomePage()));
// //                 }
// //               } else {
// //                 var reguser = await FirebaseAuthService().signIn(
// //                   email: emailController.text.trim(),
// //                   password: passwordController.text.trim(),
// //                 );

// //                 // if (reguser != null) {
// //                 //   Navigator.of(context).pushReplacement(
// //                 //       MaterialPageRoute(builder: (context) => HomePage()));
// //                 // }

// //                 if (reguser != null) {
// //                   Navigator.of(context).pushReplacement(
// //                       MaterialPageRoute(builder: (context) => MyHomePage()));
// //                 }
// //               }
// //             },
// //             child: signUp ? Text("Register") : Text("Login"),
// //           ),
// //           OutlineButton(
// //             onPressed: () {
// //               setState(() {
// //                 signUp = !signUp;
// //               });
// //             },
// //             child: signUp
// //                 ? Text("Have an account? Sign In")
// //                 : Text("Create an account"),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:firebase_redo/services/firebaseauth_service.dart';
// import 'package:flutter/material.dart';

// import 'MyHomePage.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool signUp = true;
//   String _email;
//   String _password;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("QRestaurant Login"),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   hintText: "Email",
//                 ),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return "Please enter an email";
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _email = value,
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   hintText: "Password",
//                 ),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return "Please enter a password";
//                   }
//                   return null;
//                 },
//                 onSaved: (value) => _password = value,
//               ),
//               SizedBox(height: 20.0),
//               RaisedButton(
//                 child: Text("Login"),
//                 onPressed: () async {
//                   var reguser = await FirebaseAuthService().signIn(
//                     email: emailController.text.trim(),
//                     password: passwordController.text.trim(),
//                   );

//                   if (reguser != null) {
//                     Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(builder: (context) => MyHomePage()));
//                   }

//                   if (_formKey.currentState.validate()) {
//                     _formKey.currentState.save();
//                     print("Email: $_email");
//                     print("Password: $_password");
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
