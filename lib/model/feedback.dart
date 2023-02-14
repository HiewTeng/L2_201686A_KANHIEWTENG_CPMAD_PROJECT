class Feedback {
  String food;
  String cs;
  String improve;
  String uid;

  Feedback({this.food, this.cs, this.improve, this.uid});

  Feedback.fromMap(Map<String, dynamic> data) {
    food = data['food'];
    cs = data['cs'];
    improve = data['improve'];
    uid = data['uid'];
  }

  Map<String, dynamic> toMap() {
    return {'food': food, 'cs': cs, 'improve': improve, 'uid': uid};
  }
}
