import 'package:flutter/material.dart';

import 'MyHomePage.dart';

class Reservationpage extends StatefulWidget {
  Reservationpage({Key key}) : super(key: key);

  @override
  State<Reservationpage> createState() => _ReservationpageState();
}

class _ReservationpageState extends State<Reservationpage> {
  String pax = '';
  String date = '';
  String occasion = '';

  TextEditingController controller_pax = TextEditingController();
  TextEditingController controller_date = TextEditingController();
  TextEditingController controller_occasion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESERVATION'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Text('RESERVATION',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: controller_pax,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Number of pax',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: controller_date,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Date',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: controller_occasion,
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
                      pax: controller_pax.text,
                      date: controller_date.text,
                      occasion: controller_occasion.text, id: null,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
