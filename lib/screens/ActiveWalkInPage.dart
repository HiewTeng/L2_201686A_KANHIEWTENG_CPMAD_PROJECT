import 'package:flutter/material.dart';

class ActiveWalkInPage extends StatefulWidget {
  final String walkpax;
  final String walkdate;
  final String walkoccasion;

  ActiveWalkInPage({Key key, this.walkpax, this.walkdate, this.walkoccasion})
      : super(key: key);

  @override
  State<ActiveWalkInPage> createState() => _ActiveWalkInPageState();
}

class _ActiveWalkInPageState extends State<ActiveWalkInPage> {
  @override
  Widget build(BuildContext context) {
    String textwalkpax = '';
    String textwalkdate = '';
    String textwalkoccasion = '';

    if (widget.walkpax == '2' ||
        widget.walkdate == '2/2/2022' ||
        widget.walkoccasion == 'birthday') {
      textwalkpax = widget.walkpax;
      textwalkdate = widget.walkdate;
      textwalkoccasion = widget.walkoccasion;
    } else if (widget.walkpax == '' ||
        widget.walkdate == '' ||
        widget.walkoccasion == '') {
      textwalkpax = widget.walkpax;
      textwalkdate = widget.walkdate;
      textwalkoccasion = widget.walkoccasion;
    }
    // sda
    else if (widget.walkpax != null &&
        widget.walkdate != null &&
        widget.walkoccasion != null) {
      textwalkpax = widget.walkpax;
      textwalkdate = widget.walkdate;
      textwalkoccasion = widget.walkoccasion;
    } else {
      textwalkpax = '-';
      textwalkdate = '-';
      textwalkoccasion = '-';
    }

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Text('WALK-IN(S)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
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
                child: Text('Spring Court',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.access_alarm_outlined),
                        Text('Date: ' + textwalkdate),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.watch_later_outlined),
                        Text('Waiting Time: 20mins'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.accessibility),
                        Text('Number of pax: ' + textwalkpax),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.account_circle_outlined),
                        Text('People in front: 3'),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.celebration),
                    Text('Occasion: ' + textwalkoccasion),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text('52-56 Upper Cross St, Singapore 058348'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
      //   ),
      // ],
    );
  }
}
