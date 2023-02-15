class WalkIn {
  String name;
  String phoneno;
  String pax;
  String uid;

  WalkIn({this.name, this.phoneno, this.uid});

  WalkIn.fromMap(Map<String, dynamic> data) {
    name = data['name'];
    phoneno = data['phoneno'];
    pax = data['pax'];
    uid = data['uid'];
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'phoneno': phoneno, 'pax': pax, 'uid': uid};
  }
}

// class WalkIn {
//   String date;
//   String pax;
//   String occasion;
//   String uid;

//   WalkIn({this.date, this.pax, this.occasion, this.uid});

//   WalkIn.fromMap(Map<String, dynamic> data) {
//     date = data['date'];
//     pax = data['pax'];
//     occasion = data['occasion'];
//     uid = data['uid'];
//   }

//   Map<String, dynamic> toMap() {
//     return {'date': date, 'pax': pax, 'occasion': occasion, 'uid': uid};
//   }
// }
