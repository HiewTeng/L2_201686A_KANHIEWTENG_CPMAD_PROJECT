import 'package:flutter/material.dart';

import 'ActivePage.dart';
import 'ActiveWalkInPage.dart';
import 'HistoryPage.dart';

class ActivitiesPage extends StatefulWidget {
  final String pax;
  final String date;
  final String occasion;

  final String walkpax;
  final String walkdate;
  final String walkoccasion;

  ActivitiesPage(
      {Key key,
      this.pax,
      this.date,
      this.occasion,
      this.walkpax,
      this.walkdate,
      this.walkoccasion})
      : super(key: key);

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: false,
              indicatorColor: Colors.blue,
              onTap: (index) {},
              tabs: [
                Tab(
                  text: "Reservation",
                ),
                Tab(
                  text: "Walk-In",
                ),
                Tab(text: "History"),
              ],
            ),
            // toolbarHeight: 5,
            toolbarHeight: 50,
          ),
          body: TabBarView(
            children: [
              ActivePage(),
              ActiveWalkInPage(),
              HistoryPage(
                walkInData: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
