import 'package:firebase_redo/model/walkin.dart';
import 'package:firebase_redo/pages/HistoryPage.dart';
import 'package:firebase_redo/services/firestore_service_walkin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ActiveWalkInPage extends StatefulWidget {
  @override
  State<ActiveWalkInPage> createState() => _ActiveWalkInPageState();
}

class _ActiveWalkInPageState extends State<ActiveWalkInPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<WalkIn>>(
      future: FirestoreService().readWalkInData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Text('WALK-IN(S)',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Beauty In The Pot',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                IconButton(
                                  color: Colors.blue,
                                  icon: Icon(Icons.delete),
                                  onPressed: () async {
                                    setState(() {
                                      FirestoreService().deleteWalkInData(
                                          snapshot.data[index].uid);
                                    });

                                    Fluttertoast.showToast(
                                        msg: "Data deleted successfully",
                                        gravity: ToastGravity.TOP);
                                  },
                                )
                              ],
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.person_outline_outlined),
                                  Text(' Name: ' + snapshot.data[index].name),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.phone_android_outlined),
                                  Text(' Phone No: ' +
                                      snapshot.data[index].phoneno),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.people_alt_outlined),
                                  Text(' Number of pax: ' +
                                      snapshot.data[index].pax),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.nature_people_outlined),
                                  Text(
                                    ' Number of people before you: 7',
                                    style: TextStyle(
                                        color: Colors.red), // add this line
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  Text(
                                      ' 78 Airport Blvd., #B2 - 224, Singapore 819666'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
