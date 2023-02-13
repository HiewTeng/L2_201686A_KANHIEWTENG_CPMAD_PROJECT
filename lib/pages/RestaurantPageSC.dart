import 'package:flutter/material.dart';
import 'ReservationPage.dart';
import 'WalkInPage.dart';

class RestaurantPageSC extends StatefulWidget {
  RestaurantPageSC({Key key}) : super(key: key);

  @override
  State<RestaurantPageSC> createState() => _RestaurantPageSCState();
}

class _RestaurantPageSCState extends State<RestaurantPageSC> {
  bool _hasbeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spring Court'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Image.asset('images/springcourt.png', height: 200),
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
                        'Location: 52-56 Upper Cross St, Singapore 058348',
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
                              'images/eefunoodlewithchickenandcrabmeat.jpg',
                              height: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Ee-fu Noodle with Chicken & Crabmeat',
                                  style: TextStyle(fontSize: 10.3)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('\$ 19.00',
                                  style: TextStyle(fontSize: 12)),
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
                              'images/sauteedscallopswithbroccoli.jpg',
                              height: 80,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Sauteed Scallops with Broccoli',
                                  style: TextStyle(fontSize: 10.3)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('\$ 32.00',
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

// import 'package:flutter/material.dart';
// import 'ReservationPage.dart';
// import 'WalkInPage.dart';

// class RestaurantPageSC extends StatefulWidget {
//   RestaurantPageSC({Key key}) : super(key: key);

//   @override
//   State<RestaurantPageSC> createState() => _RestaurantPageSCState();
// }

// class _RestaurantPageSCState extends State<RestaurantPageSC> {
//   bool _hasbeenPressed = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Spring Court'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 child: Image.asset('images/springcourt.png', height: 200),
//               ),
//             ),
//             Column(
//               children: <Widget>[
//                 Container(
//                   alignment: Alignment.topLeft,
//                   padding: EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         'Location: 52-56 Upper Cross St, Singapore 058348',
//                         style: TextStyle(
//                           color: Colors.pink,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.topLeft,
//                   padding: EdgeInsets.all(8.0),
//                   child: Row(
//                     children: [
//                       Text(
//                         'Chinese Cruisine',
//                         style: TextStyle(
//                           color: Colors.pink,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Center(
//               child: Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: RaisedButton(
//                       child: Text(
//                         'Make Reservation',
//                         style: new TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                         ),
//                       ),
//                       color: Colors.lightBlue,
//                       shape: RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(16.0))),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Reservationpage()),
//                         );
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(5.0),
//                     child: RaisedButton(
//                       child: Text(
//                         'Walk-In Queue',
//                         style: new TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                         ),
//                       ),
//                       color: _hasbeenPressed ? Colors.lightBlue : Colors.pink,
//                       shape: RoundedRectangleBorder(
//                           borderRadius:
//                               BorderRadius.all(Radius.circular(16.0))),
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => WalkInPage()),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 200,
//               width: 400,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.black,
//                 ),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     alignment: Alignment.topLeft,
//                     padding: EdgeInsets.all(8.0),
//                     child: Text('Menu',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 19)),
//                   ),
//                   Row(
//                     children: <Widget>[
//                       Container(
//                         alignment: Alignment.topLeft,
//                         padding: EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               'images/eefunoodlewithchickenandcrabmeat.jpg',
//                               height: 80,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                   'Ee-fu Noodle with Chicken & Crabmeat',
//                                   style: TextStyle(fontSize: 10.3)),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text('\$ 19.00',
//                                   style: TextStyle(fontSize: 12)),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         alignment: Alignment.topLeft,
//                         padding: EdgeInsets.all(8.0),
//                         child: Column(
//                           children: [
//                             Image.asset(
//                               'images/sauteedscallopswithbroccoli.jpg',
//                               height: 80,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text('Sauteed Scallops with Broccoli',
//                                   style: TextStyle(fontSize: 10.3)),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text('\$ 32.00',
//                                   style: TextStyle(fontSize: 12)),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
