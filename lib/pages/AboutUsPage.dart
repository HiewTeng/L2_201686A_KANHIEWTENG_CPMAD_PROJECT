import 'package:flutter/material.dart';

import 'FeedbackForm.dart';

class AboutUsPage extends StatefulWidget {
  AboutUsPage({Key key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        // Title
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'ABOUT US',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'Hello there! Welcome to QRestaurant. We are a start up and we wish to help people to queue digitally to avoid wasting time queueing physically. We have seen many individuals left the queue half way with an empty and disapointing stomach after queueing for an hour or more. In order to avoid such situations, we have come up with a digital queue so you can shop around the mall while staying in the queue! We hope this application will benefit you in many ways and if there is any feedback, please let us know. Thank you! - QRestaurant',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),

            // hyperlink
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                child: Text(
                  'Any Feedback?',
                  style: new TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedBackPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
