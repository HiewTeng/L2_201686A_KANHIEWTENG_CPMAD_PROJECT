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
