import 'package:firebase_redo/model/walkin.dart';
import 'package:firebase_redo/services/firestore_service_walkin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecordsPage extends StatefulWidget {
  RecordsPage({key});

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<WalkIn>>(
        future: FirestoreService().readWalkInData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snapshot.data[index].name,
                        style: TextStyle(color: Colors.blue, fontSize: 16.0),
                      ),
                      Column(
                        children: [
                          Text(
                            snapshot.data[index].phoneno,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                          // Text(
                          //   snapshot.data[index].occasion,
                          //   style:
                          //       TextStyle(color: Colors.black, fontSize: 12.0),
                          // ),
                          // Text(
                          //   snapshot.data[index].username,
                          //   style:
                          //       TextStyle(color: Colors.black, fontSize: 12.0),
                          // ),
                        ],
                      ),
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          setState(() {
                            FirestoreService()
                                .deleteWalkInData(snapshot.data[index].uid);
                          });
                          Fluttertoast.showToast(
                              msg: "Data deleted successfully",
                              gravity: ToastGravity.TOP);
                        },
                      )
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
