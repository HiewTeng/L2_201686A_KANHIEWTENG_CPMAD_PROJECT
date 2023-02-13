import 'package:flutter/material.dart';

import 'ReservationPage.dart';
import 'WalkInPage.dart';

class Paparich extends StatefulWidget {
  Paparich({Key key}) : super(key: key);

  @override
  State<Paparich> createState() => _PaparichState();
}

class _PaparichState extends State<Paparich> {
  bool _hasbeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PappaRich'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Image.asset('images/PP.png', height: 200),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Location: 83 Punggol Central, #B1-17 Waterway Point,',
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Singapore 828761',
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Malaysian Cruisine',
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: RaisedButton(
                      child: Text(
                        'Make Reservation',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      color: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Reservationpage()),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: RaisedButton(
                      child: Text(
                        'Walk-In Queue',
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      color: _hasbeenPressed ? Colors.lightBlue : Colors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.0))),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WalkInPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
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
                    child: Text('Menu',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19)),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'images/penangprawnmee.jpg',
                              height: 80,
                              width: 180,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Penang Prawn Mee',
                                  style: TextStyle(fontSize: 14.5)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('\$ 14.90',
                                  style: TextStyle(fontSize: 13)),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'images/3layertea.jpg',
                              height: 80,
                              width: 180,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('3 Layer Tea',
                                  style: TextStyle(fontSize: 14.5)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('\$ 3.60',
                                  style: TextStyle(fontSize: 13)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
