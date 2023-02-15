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
  String feedbackFood = '';
  String feedbackCs = '';
  String feedbackimprove = '';

  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
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

    FirestoreService()
        .addFeedbackData(feedbackFood, feedbackCs, feedbackimprove);

    Fluttertoast.showToast(
        msg: "Thank you for your feedback!", gravity: ToastGravity.TOP);
  }
}
