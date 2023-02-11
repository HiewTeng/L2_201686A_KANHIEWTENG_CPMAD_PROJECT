import 'package:flutter/material.dart';
import 'AboutUsPage.dart';
import 'ActivitiesPage.dart';
import 'FAQ.dart';
import 'HomePage.dart';
import 'ProfilePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'L2_201686A_Kan Hiew Teng_Project',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: MyHomePage(id: null,));
  }
}

class MyHomePage extends StatefulWidget {
  final String id;
  final String pwd;

  final String pax;
  final String date;
  final String occasion;

  final String walkpax;
  final String walkdate;
  final String walkoccasion;

  MyHomePage({
    Key key,
    @required this.id,
    this.pwd,
    this.pax,
    this.date,
    this.occasion,
    this.walkpax,
    this.walkdate,
    this.walkoccasion,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new HomePage();

      case 1:
        return new ActivitiesPage(
          pax: widget.pax,
          date: widget.date,
          occasion: widget.occasion,
          walkpax: widget.walkpax,
          walkdate: widget.walkdate,
          walkoccasion: widget.walkoccasion,
        );

      case 2:
        return new AboutUsPage();

      case 3:
        return new FAQPage();

      case 4:
        return new ProfilePage(id: widget.id, pwd: widget.pwd);

      default:
        return new Text("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.onSurface,
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('Activities'),
            icon: Icon(Icons.local_activity_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('About Us'),
            icon: Icon(Icons.info_outline),
          ),
          BottomNavigationBarItem(
            title: Text('FAQ'),
            icon: Icon(Icons.question_answer_outlined),
          ),
          BottomNavigationBarItem(
            title: Text('Profile'),
            icon: Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      body: _getDrawerItemWidget(_currentIndex),
    );
  }
}
