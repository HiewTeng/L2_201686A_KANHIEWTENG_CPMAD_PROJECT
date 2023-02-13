import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_redo/model/reservation.dart';

class FirestoreService {
  final CollectionReference reservationCollection =
      FirebaseFirestore.instance.collection('reservation');

  Future<void> addReservationData(String reservationDate, String reservationPax,
      String reservationOccasion) async {
    var docRef = FirestoreService().reservationCollection.doc();
    print('add docRef:' + docRef.id);

    await reservationCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'date': reservationDate,
      'pax': reservationPax,
      'occasion': reservationOccasion,
      // 'location': bookDescription
    });
  }

  Future<List<Reservation>> readReservationData() async {
    List<Reservation> reservationList = [];
    QuerySnapshot snapshot = await reservationCollection.get();

    snapshot.docs.forEach((document) {
      Reservation reservation = Reservation.fromMap(document.data());
      reservationList.add(reservation);
    });

    print('Reservationlist: $reservationList');
    return reservationList;
  }

  Future<void> deleteReservationData(String docId) async {
    reservationCollection.doc(docId).delete();

    print('deleting uid: ' + docId);
  }

  Future<void> updateReservationData(String reservationDate,
      String reservationPax, String reservationOccasion) async {
    var docRef = FirestoreService().reservationCollection.doc();
    print('update docRef:' + docRef.id);

    await reservationCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'date': reservationDate,
      'pax': reservationPax,
      'occasion': reservationOccasion,
      // 'location': bookDescription
    });
  }

  Future<void> deleteReservationDoc() async {
    await reservationCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_redo/model/book.dart';

// class FirestoreService {
//   final CollectionReference bookCollection =
//       FirebaseFirestore.instance.collection('books');

//   Future<void> addBookData(
//       String bookAuthor, String bookTitle, String bookDescription) async {
//     var docRef = FirestoreService().bookCollection.doc();
//     print('add docRef:' + docRef.id);

//     await bookCollection.doc(docRef.id).set({
//       'uid': docRef.id,
//       'author': bookAuthor,
//       'title': bookTitle,
//       'description': bookDescription
//     });
//   }

//   Future<List<Book>> readBookData() async {
//     List<Book> bookList = [];
//     QuerySnapshot snapshot = await bookCollection.get();

//     snapshot.docs.forEach((document) {
//       Book book = Book.fromMap(document.data());
//       bookList.add(book);
//     });

//     print('Booklist: $bookList');
//     return bookList;
//   }

//   Future<void> deleteBookData(String docId) async {
//     bookCollection.doc(docId).delete();

//     print('deleting uid: ' + docId);
//   }

//   Future<void> updateBookData(
//       String bookAuthor, String bookTitle, String bookDescription) async {
//     var docRef = FirestoreService().bookCollection.doc();
//     print('update docRef:' + docRef.id);

//     await bookCollection.doc(docRef.id).update({
//       'uid': docRef.id,
//       'author': bookAuthor,
//       'title': bookTitle,
//       'description': bookDescription
//     });
//   }

//   Future<void> deleteBookDoc() async {
//     await bookCollection.get().then((snapshot) {
//       for (DocumentSnapshot ds in snapshot.docs) {
//         ds.reference.delete();
//       }
//     });
//   }
// }
