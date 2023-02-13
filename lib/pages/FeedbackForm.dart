import 'dart:ui';
import 'package:firebase_redo/services/firestore_service_feedback.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';

import 'MyHomePage.dart';

class FeedBackPage extends StatefulWidget {
  FeedBackPage({Key key}) : super(key: key);

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  // final myController1 = TextEditingController();
  // final myController2 = TextEditingController();
  // final myController3 = TextEditingController();

  String feedbackFood = '';
  String feedbackCs = '';
  String feedbackimprove = '';

  // String feedbackFood;
  // String feedbackCs;
  // String feedbackimprove;

  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   // myController1.dispose();
  //   // myController2.dispose();
  //   // myController3.dispose();

  //   // feedbackFood.dispose();
  //   // feedbackCs.dispose();
  //   // feedbackimprove.dispose();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedback Form'), actions: <Widget>[]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0)),
                        labelText: 'How was the food?'),
                    validator: (val) =>
                        val.length == 0 ? "How was the food?" : null,
                    onSaved: (val) => this.feedbackFood = val,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0)),
                        labelText: 'How was the customer service?'),
                    validator: (val) => val.length == 0
                        ? 'How was the customer service?'
                        : null,
                    onSaved: (val) => this.feedbackCs = val,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.0)),
                        labelText: 'What can be improved?'),
                    validator: (val) =>
                        val.length == 0 ? 'What can be improved?' : null,
                    onSaved: (val) => this.feedbackimprove = val,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  // child: _isLoading
                  //     ? CircularProgressIndicator()
                  //     : RaisedButton(
                  //         onPressed: _submit,
                  //         child: Text('Submit'),
                  //       ),
                  child: _isLoading
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 10),
                            Text("Submitting"),
                          ],
                        )
                      : RaisedButton(
                          onPressed: _submit,
                          child: Text("Submit"),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() async {
    setState(() {
      _isLoading = true;
    });

    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
      await Future.delayed(Duration(seconds: 2));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                    id: null,
                  )));
    } else {
      return null;
    }

    // void _submit() {
    //   if (this.formKey.currentState.validate()) {
    //     formKey.currentState.save();
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => MyHomePage(
    //                   id: null,
    //                 )));
    //   } else {
    //     return null;
    //   }

    FirestoreService()
        .addFeedbackData(feedbackFood, feedbackCs, feedbackimprove);

    Fluttertoast.showToast(
        msg: "Thank you for your feedback!", gravity: ToastGravity.TOP);
  }
}

// import 'dart:ui';

// import 'package:flutter/material.dart';

// class FeedBackPage extends StatefulWidget {
//   FeedBackPage({Key key}) : super(key: key);

//   @override
//   State<FeedBackPage> createState() => _FeedBackPageState();
// }

// class _FeedBackPageState extends State<FeedBackPage> {
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final myController1 = TextEditingController();
//   final myController2 = TextEditingController();
//   final myController3 = TextEditingController();

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myController1.dispose();
//     myController2.dispose();
//     myController3.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Feedback Form'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Expanded(
//                   child: Text(
//                     'Feedback Form',
//                     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: myController1,
//                   decoration: InputDecoration(
//                     hintText: ('How was the food?'),
//                     hintStyle: TextStyle(fontWeight: FontWeight.w300),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.grey,
//                         width: 0.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: myController2,
//                   decoration: InputDecoration(
//                     hintText: ('How was the customer service?'),
//                     hintStyle: TextStyle(fontWeight: FontWeight.w300),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.grey,
//                         width: 0.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TextField(
//                   controller: myController3,
//                   decoration: InputDecoration(
//                     hintText: ('What can be improved?'),
//                     hintStyle: TextStyle(fontWeight: FontWeight.w300),
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 50, horizontal: 13),
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(
//                         color: Colors.grey,
//                         width: 0.0,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     RaisedButton(
//                       child: Text('Clear Text'),
//                       onPressed: () {
//                         myController1.clear();
//                         myController2.clear();
//                         myController3.clear();
//                       },
//                     ),
//                     SizedBox(width: 5),
//                     RaisedButton(
//                       child: Text("Submit"),
//                       onPressed: () {
//                         myController1.clear();
//                         myController2.clear();
//                         myController3.clear();
// //                         ScaffoldMessenger.of(context).showSnackBar(
// //                           const SnackBar(
// //                             content: Text('Processing Data'),
// //                           ),
// //                         );
// //                         const snackBar = SnackBar(
// //                           content: Text('Yay! A SnackBar!'),
// //                         );

// // // Find the ScaffoldMessenger in the widget tree
// // // and use it to show a SnackBar.
// //                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                       },
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
