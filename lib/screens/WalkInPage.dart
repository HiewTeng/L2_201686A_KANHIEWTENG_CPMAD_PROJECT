import 'package:flutter/material.dart';

import 'MyHomePage.dart';

class WalkInPage extends StatefulWidget {
  WalkInPage({Key key}) : super(key: key);

  @override
  State<WalkInPage> createState() => _WalkInPageState();
}

class _WalkInPageState extends State<WalkInPage> {
  String walkpax = '';
  String walkdate = '';
  String walkoccasion = '';

  TextEditingController controller_walkpax = TextEditingController();
  TextEditingController controller_walkdate = TextEditingController();
  TextEditingController controller_walkoccasion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WALK-IN QUEUE'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Text('WALK-IN QUEUE',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Text('Wating time: 15 mins',
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
              child: TextField(
                controller: controller_walkpax,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number of pax',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: controller_walkdate,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Date',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: controller_walkoccasion,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sepcial Occasion(s)',
                  hintText: 'Eg, Birthday, Anniversary',
                ),
              ),
            ),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Confirm'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyHomePage(
                            walkpax: controller_walkpax.text,
                            walkdate: controller_walkdate.text,
                            walkoccasion: controller_walkoccasion.text,
                            id: null,
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
