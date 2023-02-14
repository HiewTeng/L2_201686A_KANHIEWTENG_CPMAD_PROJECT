import 'package:firebase_redo/services/firebaseauth_service.dart';
import 'package:flutter/material.dart';
import 'MyHomePage copy.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool signUp = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                obscureText: true,
                onSaved: (value) => _password = value,
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                onPressed: () async {
                  var newuser = await FirebaseAuthService().signUp(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  if (newuser != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => MyHomePage(
                              id: null,
                            )));
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'login_page.dart';

// class RegisterPage extends StatefulWidget {
//   RegisterPage({Key key}) : super(key: key);

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   TextEditingController dateinput = TextEditingController();
//   //text editing controller for text field

//   @override
//   void initState() {
//     dateinput.text = ""; //set the initial value of text field
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           // return Align(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(45.0),
//                 child: Container(
//                   child: Text(
//                     'Register',
//                     style: TextStyle(fontWeight: FontWeight.w300, fontSize: 30),
//                     textAlign: TextAlign.start,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                       hintText: ('Email'),
//                       hintStyle: TextStyle(fontWeight: FontWeight.w300),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(
//                           (30),
//                         ),
//                       )),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: ('Password'),
//                     hintStyle: TextStyle(fontWeight: FontWeight.w300),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(
//                         (30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: ('Mobile Number'),
//                     hintStyle: TextStyle(fontWeight: FontWeight.w300),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(
//                         (30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     hintText: ('Birthday (DD/MM/YYY)'),
//                     hintStyle: TextStyle(fontWeight: FontWeight.w300),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(
//                         (30),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: FlatButton(
//                   child: Text('Have an account!',
//                       style: new TextStyle(
//                         color: Colors.blue,
//                         decoration: TextDecoration.underline,
//                         fontSize: 16,
//                       )),
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => LoginPage()),
//                     );
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: RaisedButton(
//                     child: Text('Register'),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginPage()),
//                       );
//                     }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
