// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'package:flutter/material.dart';
import 'RestaurantPageBITP.dart';
import 'RestaurantPageDXE.dart';
import 'RestaurantPagePapparich.dart';
import 'RestaurantPageSC.dart';
import 'RestaurantPageTE.dart';
import 'RestaurantPageYB.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showBackToTopButton = false;

  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      // callback
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 50) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  // This function is triggered when the user presses the back-to-top button
  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: Duration(seconds: 2),
        curve: Curves.linear); //curve means slowly
  }

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QRestaurant'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Text('QRestaurant',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.blueAccent,
                      ),
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(10.0, 1.0, .0, 15.0),
                          prefixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: "Search for restaurant",
                          hintStyle: TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 32.0),
                              borderRadius: BorderRadius.circular(25.0)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 32.0),
                              borderRadius: BorderRadius.circular(25.0)))),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'images/springcourt.png',
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: Text(
                            'Spring Court',
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RestaurantPageSC()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'images/BITP.png',
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: Text(
                            'Beauty In The Pot',
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RestaurantPageBITP()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'images/DXE.png',
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: Text(
                            'Dian Xiao Er',
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DianXiaoEr()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'images/YB.png',
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: Text(
                            'YardBird',
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => YardBird()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'images/PP.png',
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: Text(
                            'Papparich',
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Paparich()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'images/thaiexpress.png',
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          child: Text(
                            'Thai Express',
                            style: new TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ThaiExpressPage()),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              child: Icon(Icons.arrow_upward),
            ),
    );
  }
}
