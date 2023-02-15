import 'package:firebase_redo/services/firestore_service_walkin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'MyHomePage.dart';

class WalkInPage extends StatefulWidget {
  WalkInPage({Key key}) : super(key: key);

  @override
  State<WalkInPage> createState() => _WalkInPageState();
}

class _WalkInPageState extends State<WalkInPage> {
  String walkinName;
  String walkinPhoneNo;
  String walkinPax;

  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WALK-IN'), actions: <Widget>[]),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Text('WALK-IN',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Text('Waiting time: 15 mins',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Text('Number of people in queue: 5',
                        style: TextStyle(color: Colors.red, fontSize: 18)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Name'),
                  validator: (val) => val.length == 0 ? "Name" : null,
                  onSaved: (val) => this.walkinName = val,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Phone No'),
                  validator: (val) => val.length == 0 ? "Phone No" : null,
                  onSaved: (val) => this.walkinPhoneNo = val,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Number of pax'),
                  validator: (val) => val.length == 0 ? "Number of pax" : null,
                  onSaved: (val) => this.walkinPax = val,
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
                          Text("Queueing..."),
                        ],
                      )
                    : RaisedButton(
                        onPressed: _submit,
                        child: Text("Walk in now!"),
                      ),
              )
            ],
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

    FirestoreService().addWalkInData(walkinName, walkinPhoneNo, walkinPax);

    Fluttertoast.showToast(
        msg:
            "You are now in the queue. We will message you when it's your turn. Waiting time: 7mins",
        gravity: ToastGravity.TOP);
  }
}
