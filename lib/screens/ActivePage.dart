import 'package:flutter/material.dart';

class ActivePage extends StatefulWidget {
  final String pax;
  final String date;
  final String occasion;

  final String walkpax;
  final String walkdate;
  final String walkoccasion;

  ActivePage(
      {Key key,
      this.pax,
      this.date,
      this.occasion,
      this.walkpax,
      this.walkdate,
      this.walkoccasion})
      : super(key: key);

  @override
  State<ActivePage> createState() => _ActivePageState();
}

class _ActivePageState extends State<ActivePage> {
  @override
  Widget build(BuildContext context) {
    String textpax = '';
    String textdate = '';
    String textoccasion = '';
    String header = '';
    if (widget.pax == '2' &&
        widget.date == '2/2/2022' &&
        widget.occasion == 'birthday') {
      textpax = widget.pax;
      textdate = widget.date;
      textoccasion = widget.occasion;
    } else if (widget.pax != null &&
        widget.date != null &&
        widget.occasion != null) {
      textpax = widget.pax;
      textdate = widget.date;
      textoccasion = widget.occasion;
    } else if (widget.pax == '' || widget.date == '' || widget.occasion == '') {
      textpax = widget.pax;
      textdate = widget.date;
      textoccasion = widget.occasion;
    } else {
      textpax = 'NIL';
      textdate = 'NIL';
      textoccasion = 'No remarks';
    }

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child: Text('RESERVATION(S)',
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
                child: Text('Beauty In The Pot',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.access_alarm_outlined),
                    Text(' Date: ' + textdate),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.accessibility),
                    Text(' Number of pax: ' + textpax),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.celebration),
                    Text(' Occasion: ' + textoccasion),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text('78 Airport Blvd., #B2 - 224, Singapore 819666'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
