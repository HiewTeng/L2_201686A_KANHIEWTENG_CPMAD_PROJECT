import 'package:firebase_redo/model/walkin.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  final WalkIn walkInData;

  HistoryPage({Key key, @required this.walkInData}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Text('HISTORY',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          ),
        ),
        Container(
          height: 165,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(8.0),
                child: Text('Beauty In The Pot',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.access_alarm_outlined),
                    Text('11/2/2022, 13:00'),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.accessibility),
                    Text('Number of pax: 2'),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text('78 Airport Blvd., #B2 - 224, Singapore 819666'),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Second Container
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 165,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              border: Border.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Text('Spring Court',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.access_alarm_outlined),
                      Text('30/2/2022, 5:00'),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.accessibility),
                      Text('Number of pax: 5'),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text('52-56 Upper Cross St, Singapore 058348'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
