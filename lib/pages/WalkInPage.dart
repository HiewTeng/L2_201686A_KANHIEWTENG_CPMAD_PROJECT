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
  // String walkpax = '';
  // String walkdate = '';
  // String walkoccasion = '';

  // TextEditingController controller_walkpax = TextEditingController();
  // TextEditingController controller_walkdate = TextEditingController();
  // TextEditingController controller_walkoccasion = TextEditingController();

  String walkinPax;
  String walkinDate;
  String walkinOccasion;

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
              // appBar: AppBar(
              //   title: Text('WALK-IN QUEUE'),
              // ),
              // body: SingleChildScrollView(
              //   padding: EdgeInsets.all(15),
              //   child: Column(
              //     children: <Widget>[
              //       Padding(
              //         padding: const EdgeInsets.all(10.0),
              //         child: Container(
              //           child: Text('WALK-IN QUEUE',
              //               style:
              //                   TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              //         ),
              //       ),
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
                      border: OutlineInputBorder(), labelText: 'Date'),
                  validator: (val) => val.length == 0 ? "Date" : null,
                  onSaved: (val) => this.walkinDate = val,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Numebr of pax'),
                  validator: (val) => val.length == 0 ? "Number of pax" : null,
                  onSaved: (val) => this.walkinPax = val,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Special Occasion(s)'),
                  validator: (val) =>
                      val.length == 0 ? "Special Occasion(s)" : null,
                  onSaved: (val) => this.walkinOccasion = val,
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
                        child: Text("Walk now!"),
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

    FirestoreService().addWalkInData(walkinDate, walkinPax, walkinOccasion);

    Fluttertoast.showToast(msg: "Queueing now!", gravity: ToastGravity.TOP);
  }
}
