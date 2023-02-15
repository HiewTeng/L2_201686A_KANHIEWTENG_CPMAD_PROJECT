import 'package:firebase_redo/model/reservation.dart';
import 'package:firebase_redo/services/firestore_service_reservation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ActivePage extends StatefulWidget {
  @override
  State<ActivePage> createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Reservation>>(
      future: FirestoreService().readReservationData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Text('RESERVATION(S)',
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
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Beauty In The Pot',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ),
                                IconButton(
                                  color: Colors.blue,
                                  icon: Icon(Icons.delete),
                                  onPressed: () async {
                                    setState(() {
                                      FirestoreService().deleteReservationData(
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
                                  Icon(Icons.access_alarm_outlined),
                                  Text(' Date: ' + snapshot.data[index].date),
                                ],
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.accessibility),
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
                                  Icon(Icons.celebration),
                                  Text(' Occasion: ' +
                                      snapshot.data[index].occasion),
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
                                      '78 Airport Blvd., #B2 - 224, Singapore 819666'),
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
