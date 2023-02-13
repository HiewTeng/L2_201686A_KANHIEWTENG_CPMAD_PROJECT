class Reservation {
  String date;
  String pax;
  String occasion;
  // String location;
  String uid;

  Reservation({this.date, this.pax, this.occasion, this.uid});

  Reservation.fromMap(Map<String, dynamic> data) {
    date = data['date'];
    pax = data['pax'];
    occasion = data['ocasion'];
    uid = data['uid'];
  }

  Map<String, dynamic> toMap() {
    return {'date': date, 'pax': pax, 'occasion': occasion, 'uid': uid};
  }
}

// class Book {
//   String uid;
//   String author;
//   String title;
//   String description;

//   Book({this.uid, this.author, this.title, this.description});

//   Book.fromMap(Map<String, dynamic> data) {
//     uid = data['uid'];
//     author = data['author'];
//     title = data['title'];
//     description = data['description'];
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'uid': uid,
//       'author': author,
//       'title': title,
//       'description': description
//     };
//   }
// }
