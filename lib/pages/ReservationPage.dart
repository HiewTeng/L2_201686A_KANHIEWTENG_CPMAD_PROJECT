import 'package:firebase_redo/services/firestore_service_reservation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'MyHomePage.dart';

class Reservationpage extends StatefulWidget {
  Reservationpage({Key key}) : super(key: key);

  @override
  State<Reservationpage> createState() => _ReservationpageState();
}

class _ReservationpageState extends State<Reservationpage> {
  // String pax = '';
  // String date = '';
  // String occasion = '';

  String reservationPax;
  String reservationDate;
  String reservationOccasion;

  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // TextEditingController controller_pax = TextEditingController();
  // TextEditingController controller_date = TextEditingController();
  // TextEditingController controller_occasion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RESERVATION'), actions: <Widget>[]),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Form(
          key: formKey,
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
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Date'),
                  validator: (val) => val.length == 0 ? "Date" : null,
                  onSaved: (val) => this.reservationDate = val,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Numebr of pax'),
                  validator: (val) => val.length == 0 ? "Number of pax" : null,
                  onSaved: (val) => this.reservationPax = val,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Special Occasion(s)'),
                  validator: (val) =>
                      val.length == 0 ? "Special Occasion(s)" : null,
                  onSaved: (val) => this.reservationOccasion = val,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: _isLoading
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 10),
                          Text("Booking a reservation..."),
                        ],
                      )
                    : RaisedButton(
                        onPressed: _submit,
                        child: Text("Reserve"),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submit() async {
    setState(() {
      _isLoading = true;
    });

    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
      await Future.delayed(Duration(seconds: 2));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage(
                    id: null,
                  )));
    } else {
      return null;
    }

    FirestoreService().addReservationData(
        reservationPax, reservationDate, reservationOccasion);

    Fluttertoast.showToast(
        msg: "Reservation has been made.", gravity: ToastGravity.TOP);
  }
}
// TextFormField(
//   keyboardType: TextInputType.text,
//   decoration: InputDecoration(
//       border: OutlineInputBorder(), labelText: 'Date'),
//   validator: (val) => val.length == 0 ? "Date" : null,
//   onSaved: (val) => this.reservationDate = val,
// ),

// Padding(
//   padding: EdgeInsets.all(15),
//   child: TextField(
//     controller: controller_occasion,
//     decoration: InputDecoration(
//       border: OutlineInputBorder(),
//       labelText: 'Sepcial Occasion(s)',
//       hintText: 'Eg, Birthday, Anniversary',
//     ),
//   ),
// ),

// TextFormField(
//   keyboardType: TextInputType.text,
//   decoration: InputDecoration(labelText: 'Special occasion(s)'),
//   validator: (val) =>
//       val.length == 0 ? "Special occasion(s)" : null,
//   onSaved: (val) => this.reservationOccasion = val,
// ),

// RaisedButton(
//   textColor: Colors.white,
//   color: Colors.blue,
//   child: Text('Confirm'),
//   onPressed: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => MyHomePage(
//           pax: controller_pax.text,
//           date: controller_date.text,
//           occasion: controller_occasion.text,
//           id: null,
//         ),
//       ),
//     );
//   },
//   ),

// import 'package:flutter/material.dart';

// import 'MyHomePage.dart';

// class Reservationpage extends StatefulWidget {
//   Reservationpage({Key key}) : super(key: key);

//   @override
//   State<Reservationpage> createState() => _ReservationpageState();
// }

// class _ReservationpageState extends State<Reservationpage> {
//   // String pax = '';
//   // String date = '';
//   // String occasion = '';

//   String pax;
//   String date;
//   String occasion;

//   TextEditingController controller_pax = TextEditingController();
//   TextEditingController controller_date = TextEditingController();
//   TextEditingController controller_occasion = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('RESERVATION'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(15),
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Container(
//                 child: Text('RESERVATION',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(15),
//               child: TextField(
//                 controller: controller_pax,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Number of pax',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(15),
//               child: TextField(
//                 controller: controller_date,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Date',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(15),
//               child: TextField(
//                 controller: controller_occasion,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Sepcial Occasion(s)',
//                   hintText: 'Eg, Birthday, Anniversary',
//                 ),
//               ),
//             ),
//             RaisedButton(
//               textColor: Colors.white,
//               color: Colors.blue,
//               child: Text('Confirm'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MyHomePage(
//                       pax: controller_pax.text,
//                       date: controller_date.text,
//                       occasion: controller_occasion.text,
//                       id: null,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
