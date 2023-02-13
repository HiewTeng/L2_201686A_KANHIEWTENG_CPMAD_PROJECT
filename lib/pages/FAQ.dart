import 'package:flutter/material.dart';

import 'AboutUsPage.dart';
import 'ActivitiesPage.dart';
import 'ProfilePage.dart';

class FAQPage extends StatefulWidget {
  FAQPage({Key key}) : super(key: key);

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: Text(
                    'Frequently Asked Questions',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // show and keep
              ExpansionTile(
                title: Text(
                  'Where do I make reservation?',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'You can make reservation by clicking on the resturants.',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                  'Where can I view my personal information?',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'You can view your personal information at profile page.',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                      child: Text(
                        'Profile Page',
                        style: new TextStyle(
                          color: Colors.yellow[900],
                          decoration: TextDecoration.underline,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage(id: null,)),
                        );
                      },
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('What is QRestaurant',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'QRestaurant is our name! To know more about us, head to About Us Page!',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                      child: Text(
                        'About Us Page',
                        style: new TextStyle(
                          color: Colors.yellow[900],
                          decoration: TextDecoration.underline,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutUsPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('Where do I view my reservation?',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                children: <Widget>[
                  ListTile(
                    // title: Text(
                    //   'You can view it at "Activities page".',
                    //   style: TextStyle(color: Colors.blue, fontSize: 18),
                    // ),
                    title: Text(
                      'You can view it at Activities Page!',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: FlatButton(
                      child: Text(
                        'Activities Page',
                        style: new TextStyle(
                          color: Colors.yellow[900],
                          decoration: TextDecoration.underline,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivitiesPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
