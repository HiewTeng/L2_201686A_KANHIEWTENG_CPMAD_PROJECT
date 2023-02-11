import 'package:flutter/material.dart';

import 'FirstScreen.dart';

class ProfilePage extends StatefulWidget {
  final String id;
  final String pwd;

  ProfilePage({Key key, @required this.id, this.pwd}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    String textId = '';

    if (widget.id == 'admin') {
      textId = widget.id;
    } else {
      textId = 'guest';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        'Welcome back!',
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 30),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(
                        textId,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: 370,
                        width: 355,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(8.0),
                              child: Text('Username: ' + textId,
                                  style: TextStyle(fontSize: 20)),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(8.0),
                              child: Text('Email: 201686A@mymail.nyp.edu.sg',
                                  style: TextStyle(fontSize: 20)),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(8.0),
                              child: Text('Phone No: 9855 1232',
                                  style: TextStyle(fontSize: 20)),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.all(8.0),
                              child: Text('Birthday: 11/12/2001',
                                  style: TextStyle(fontSize: 20)),
                            ),
                            Center(
                              child: Align(
                                alignment: Alignment.center,
                                child: RaisedButton(
                                  color: Colors.blue,
                                  elevation: 5,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FirstScreen()),
                                    );
                                  },
                                  child: Text('Logout'),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
