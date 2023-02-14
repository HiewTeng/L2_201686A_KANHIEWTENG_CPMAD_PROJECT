class WalkIn {
  String date;
  String pax;
  String occasion;
  String uid;

  WalkIn({this.date, this.pax, this.occasion, this.uid});

  WalkIn.fromMap(Map<String, dynamic> data) {
    date = data['date'];
    pax = data['pax'];
    occasion = data['occasion'];
    uid = data['uid'];
  }

  Map<String, dynamic> toMap() {
    return {'date': date, 'pax': pax, 'occasion': occasion, 'uid': uid};
  }
}
