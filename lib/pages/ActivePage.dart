import 'package:firebase_redo/model/reservation.dart';
import 'package:firebase_redo/services/firestore_service_reservation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ActivePage extends StatefulWidget {
  ActivePage({key, String pax});

  // final String pax;
  // final String date;
  // final String occasion;

  // final String walkpax;
  // final String walkdate;
  // final String walkoccasion;

  // ActivePage(
  //     {Key key,
  //     this.pax,
  //     this.date,
  //     this.occasion,
  //     this.walkpax,
  //     this.walkdate,
  //     this.walkoccasion})
  //     : super(key: key);

  @override
  State<ActivePage> createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Reservation>>(
        future: FirestoreService().readReservationData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                Card(
                  elevation: 9,
                  // child: Row(
                  // children: <Widget>[
                  //   Padding(
                  //     padding: const EdgeInsets.all(10.0),
                  //     child: Container(
                  //       child: Text('RESERVATION(S)',
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold, fontSize: 25)),
                  //     ),
                  //   ),
                  //   Container(
                  //     height: 200,
                  //     width: 400,
                  //     decoration: BoxDecoration(
                  //       border: Border.all(
                  //         color: Colors.black,
                  //       ),
                  //       borderRadius: BorderRadius.circular(10.0),
                  //     ),
// child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 alignment: Alignment.topLeft,
//                 padding: EdgeInsets.all(8.0),
//                 child: Text('Beauty In The Pot',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//               ),
//             ],
// ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snapshot.data[index].date,
                        style: TextStyle(color: Colors.blue, fontSize: 16.0),
                      ),
                      // Column(
                      //   children: [
                      //     Text(
                      //       snapshot.data[index].pax,
                      //       style:
                      //           TextStyle(color: Colors.black, fontSize: 14.0),
                      //     ),

                      //     // Text(
                      //     //   snapshot.data[index].occasion,
                      //     //   style:
                      //     //       TextStyle(color: Colors.black, fontSize: 12.0),
                      //     // ),
                      //     // Text(
                      //     //   snapshot.data[index].description,
                      //     //   style:
                      //     //       TextStyle(color: Colors.black, fontSize: 12.0),
                      //     // ),
                    ],
                  ),
                  //     IconButton(
                  //       color: Colors.blue,
                  //       icon: Icon(Icons.delete),
                  //       onPressed: () async {
                  //         setState(() {
                  //           FirestoreService().deleteReservationData(
                  //               snapshot.data[index].uid);
                  //         });
                  //         Fluttertoast.showToast(
                  //             msg: "Data deleted successfully",
                  //             gravity: ToastGravity.TOP);
                  //       },
                  //     )
                  //   ],
                  // ),
                  // ),
                  // ],
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder<List<Reservation>>(
//         future: FirestoreService().readReservationData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data.length,
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 5,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         snapshot.data[index].date,
//                         style: TextStyle(color: Colors.blue, fontSize: 16.0),
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             snapshot.data[index].pax,
//                             style:
//                                 TextStyle(color: Colors.black, fontSize: 14.0),
//                           ),
//                           // Text(
//                           //   snapshot.data[index].occasion,
//                           //   style:
//                           //       TextStyle(color: Colors.black, fontSize: 12.0),
//                           // ),
//                           // Text(
//                           //   snapshot.data[index].description,
//                           //   style:
//                           //       TextStyle(color: Colors.black, fontSize: 12.0),
//                           // ),
//                         ],
//                       ),
//                       IconButton(
//                         color: Colors.blue,
//                         icon: Icon(Icons.delete),
//                         onPressed: () async {
//                           setState(() {
//                             FirestoreService().deleteReservationData(
//                                 snapshot.data[index].uid);
//                           });
//                           Fluttertoast.showToast(
//                               msg: "Data deleted successfully",
//                               gravity: ToastGravity.TOP);
//                         },
//                       )
//                     ],
//                   ),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Text("${snapshot.error}");
//           }

//           return Container(
//             alignment: AlignmentDirectional.center,
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }

// return Column(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Container(
//             child: Text('RESERVATION(S)',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
//           ),
//         ),
//         Container(
//           height: 200,
//           width: 400,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.black,
//             ),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 alignment: Alignment.topLeft,
//                 padding: EdgeInsets.all(8.0),
//                 child: Text('Beauty In The Pot',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//               ),
//               Container(
//                 alignment: Alignment.topLeft,
//                 padding: EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Icon(Icons.access_alarm_outlined),
//                     // Text(' Date: ' + textdate),
// snapshot.data[index].date,
//                         style: TextStyle(color: Colors.blue, fontSize: 16.0),
//                   ],
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.topLeft,
//                 padding: EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Icon(Icons.accessibility),
//                     // Text(' Number of pax: ' + textpax),
//                       snapshot.data[index].pax,
//                             style:
//                                 TextStyle(color: Colors.black, fontSize: 14.0),
//                   ],
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.topLeft,
//                 padding: EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Icon(Icons.celebration),
//                     Text(' Occasion: ' + textoccasion),
//                   ],
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.topLeft,
//                 padding: EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Icon(Icons.location_on_outlined),
//                     Text('78 Airport Blvd., #B2 - 224, Singapore 819666'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ActivePage extends StatefulWidget {
//   final String pax;
//   final String date;
//   final String occasion;

//   final String walkpax;
//   final String walkdate;
//   final String walkoccasion;

//   ActivePage(
//       {Key key,
//       this.pax,
//       this.date,
//       this.occasion,
//       this.walkpax,
//       this.walkdate,
//       this.walkoccasion})
//       : super(key: key);

//   @override
//   State<ActivePage> createState() => _ActivePageState();
// }

// class _ActivePageState extends State<ActivePage> {
//   @override
//   Widget build(BuildContext context) {
//     String textpax = '';
//     String textdate = '';
//     String textoccasion = '';
//     // String header = '';
//     if (widget.pax == '2' &&
//         widget.date == '2/2/2022' &&
//         widget.occasion == 'birthday') {
//       textpax = widget.pax;
//       textdate = widget.date;
//       textoccasion = widget.occasion;
//     } else if (widget.pax != null &&
//         widget.date != null &&
//         widget.occasion != null) {
//       textpax = widget.pax;
//       textdate = widget.date;
//       textoccasion = widget.occasion;
//     } else if (widget.pax == '' || widget.date == '' || widget.occasion == '') {
//       textpax = widget.pax;
//       textdate = widget.date;
//       textoccasion = widget.occasion;
//     } else {
//       textpax = 'NIL';
//       textdate = 'NIL';
//       textoccasion = 'No remarks';
//     }

//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Container(
//             child: Text('RESERVATION(S)',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
//           ),
//         ),
//         Container(
//           height: 200,
//           width: 400,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.black,
//             ),
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               Container(
//                 alignment: Alignment.topLeft,
//                 padding: EdgeInsets.all(8.0),
//                 child: Text('Beauty In The Pot',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
//               ),
//               Container(
//                 alignment: Alignment.topLeft,
//                 padding: EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Icon(Icons.access_alarm_outlined),
//                     Text(' Date: ' + textdate),
//                   ],
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.topLeft,
//                 padding: EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Icon(Icons.accessibility),
//                     Text(' Number of pax: ' + textpax),
//                   ],
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.topLeft,
//                 padding: EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Icon(Icons.celebration),
//                     Text(' Occasion: ' + textoccasion),
//                   ],
//                 ),
//               ),
//               Container(
//                 alignment: Alignment.topLeft,
//                 padding: EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Icon(Icons.location_on_outlined),
//                     Text('78 Airport Blvd., #B2 - 224, Singapore 819666'),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
