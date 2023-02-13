import 'package:flutter/material.dart';

import 'ReservationPage.dart';
import 'WalkInPage.dart';

class RestaurantPageBITP extends StatefulWidget {
  RestaurantPageBITP({Key key}) : super(key: key);

  @override
  State<RestaurantPageBITP> createState() => _RestaurantPageBITPState();
}

class _RestaurantPageBITPState extends State<RestaurantPageBITP> {
  bool _hasbeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beauty In The Pot'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Image.asset('images/BITP.png', height: 200),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Location: 78 Airport Blvd., #B2 - 224, Singapore 819666',
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
                        'Chinese Cruisine',
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
                              'images/ricecake.jpg',
                              height: 80,
                              width: 180,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Rice Cake',
                                  style: TextStyle(fontSize: 12)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text('From \$ 3.91',
                                  style: TextStyle(fontSize: 12)),
                            ),
                          ],
                        ),
                      ),

                      // ],
                      // ),

                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'images/squidball.jpg',
                              height: 80,
                              width: 180,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Squid Ball',
                                  style: TextStyle(fontSize: 12)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text('From \$ 7.00',
                                  style: TextStyle(fontSize: 12)),
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
