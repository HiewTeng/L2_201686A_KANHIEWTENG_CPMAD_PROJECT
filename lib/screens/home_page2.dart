import 'package:firebase_redo/screens/showrecords_page.dart';
import 'package:firebase_redo/services/firebaseauth_service.dart';
import 'package:flutter/material.dart';
import 'addrecord_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("WELCOME HOME", style: TextStyle(fontSize: 30)),
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.add_box),
                iconSize: 60,
                tooltip: 'add record',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddRecordPage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.list),
                iconSize: 60,
                tooltip: 'view records',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RecordsPage()));
                },
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        backgroundColor: Colors.blueAccent,
        tooltip: 'Sign Out',
        onPressed: () async{
          await FirebaseAuthService().signOut();
          Navigator.of(context).pushNamed('/login');
        },
      ),
    );
  }
}
