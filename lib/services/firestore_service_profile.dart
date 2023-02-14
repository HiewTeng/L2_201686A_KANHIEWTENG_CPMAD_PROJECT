// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreService {
//   final CollectionReference walkInCollection =
//       FirebaseFirestore.instance.collection('walkIn');

//   Future<void> addWalkInData(
//       String walkInDate, String walkInPax, String walkInOccasion) async {
//     var docRef = FirestoreService().walkInCollection.doc();
//     print('add docRef:' + docRef.id);

//     await walkInCollection.doc(docRef.id).set({
//       'uid': docRef.id,
//       'date': walkInDate,
//       'pax': walkInPax,
//       'occasion': walkInOccasion,
//       // 'location': bookDescription
//     });
//   }

//   Future<List<WalkIn>> readWalkInData() async {
//     List<WalkIn> walkInList = [];
//     QuerySnapshot snapshot = await walkInCollection.get();

//     snapshot.docs.forEach((document) {
//       WalkIn walkIn = WalkIn.fromMap(document.data());
//       walkInList.add(walkIn);
//     });

//     print('walkInList: $walkInList');
//     return walkInList;
//   }

//   Future<void> deleteWalkInData(String docId) async {
//     walkInCollection.doc(docId).delete();

//     print('deleting uid: ' + docId);
//   }

//   Future<void> updateWalkInData(
//       String walkInDate, String walkInPax, String walkInOccasion) async {
//     var docRef = FirestoreService().walkInCollection.doc();
//     print('update docRef:' + docRef.id);

//     await walkInCollection.doc(docRef.id).update({
//       'uid': docRef.id,
//       'date': walkInDate,
//       'pax': walkInPax,
//       'occasion': walkInOccasion,
//       // 'location': bookDescription
//     });
//   }

//   Future<void> deleteWalkInDoc() async {
//     await walkInCollection.get().then((snapshot) {
//       for (DocumentSnapshot ds in snapshot.docs) {
//         ds.reference.delete();
//       }
//     });
//   }
// }

// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_redo/model/book.dart';

// // class FirestoreService {
// //   final CollectionReference bookCollection =
// //       FirebaseFirestore.instance.collection('books');

// //   Future<void> addBookData(
// //       String bookAuthor, String bookTitle, String bookDescription) async {
// //     var docRef = FirestoreService().bookCollection.doc();
// //     print('add docRef:' + docRef.id);

// //     await bookCollection.doc(docRef.id).set({
// //       'uid': docRef.id,
// //       'author': bookAuthor,
// //       'title': bookTitle,
// //       'description': bookDescription
// //     });
// //   }

// //   Future<List<Book>> readBookData() async {
// //     List<Book> bookList = [];
// //     QuerySnapshot snapshot = await bookCollection.get();

// //     snapshot.docs.forEach((document) {
// //       Book book = Book.fromMap(document.data());
// //       bookList.add(book);
// //     });

// //     print('Booklist: $bookList');
// //     return bookList;
// //   }

// //   Future<void> deleteBookData(String docId) async {
// //     bookCollection.doc(docId).delete();

// //     print('deleting uid: ' + docId);
// //   }

// //   Future<void> updateBookData(
// //       String bookAuthor, String bookTitle, String bookDescription) async {
// //     var docRef = FirestoreService().bookCollection.doc();
// //     print('update docRef:' + docRef.id);

// //     await bookCollection.doc(docRef.id).update({
// //       'uid': docRef.id,
// //       'author': bookAuthor,
// //       'title': bookTitle,
// //       'description': bookDescription
// //     });
// //   }

// //   Future<void> deleteBookDoc() async {
// //     await bookCollection.get().then((snapshot) {
// //       for (DocumentSnapshot ds in snapshot.docs) {
// //         ds.reference.delete();
// //       }
// //     });
// //   }
// // }
