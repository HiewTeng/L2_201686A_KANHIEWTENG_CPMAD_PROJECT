import 'package:flutter/material.dart';

import 'ReservationPage.dart';
import 'WalkInPage.dart';

class YardBird extends StatefulWidget {
  YardBird({Key key}) : super(key: key);

  @override
  State<YardBird> createState() => _YardBirdState();
}

class _YardBirdState extends State<YardBird> {
  bool _hasbeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YardBird'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Image.asset('images/YB.png', height: 200),
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
                        'Location: 2 Bayfront Ave, # B1 - 07, Singapore 018972',
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 16,
                        ),
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
                        'Southern Cruisine',
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
                              'images/chickenandwatermelonnwaffles.png',
                              height: 80,
                              width: 180,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Chicken and Watermelon',
                                  style: TextStyle(fontSize: 11.5)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Text('and Waffles',
                                  style: TextStyle(fontSize: 11.5)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('\$ 40.00',
                                  style: TextStyle(fontSize: 11.5)),
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
                              'images/chickenwing.jpg',
                              height: 90,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('YardBird Chicken Wing',
                                  style: TextStyle(fontSize: 14.5)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('\$ 20.00',
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
