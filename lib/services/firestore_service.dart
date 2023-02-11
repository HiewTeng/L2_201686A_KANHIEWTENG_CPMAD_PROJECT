import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_redo/model/book.dart';

class FirestoreService {
  final CollectionReference bookCollection =
      FirebaseFirestore.instance.collection('books');

  Future<void> addBookData(
      String bookAuthor, String bookTitle, String bookDescription) async {
    var docRef = FirestoreService().bookCollection.doc();
    print('add docRef:' + docRef.id);

    await bookCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'author': bookAuthor,
      'title': bookTitle,
      'description': bookDescription
    });
  }

  Future<List<Profile>> readBookData() async {
    List<Profile> bookList = [];
    QuerySnapshot snapshot = await bookCollection.get();

    snapshot.docs.forEach((document) {
      Profile book = Profile.fromMap(document.data());
      bookList.add(book);
    });

    print('Booklist: $bookList');
    return bookList;
  }

  Future<void> deleteBookData(String docId) async {
    bookCollection.doc(docId).delete();

    print('deleting uid: ' + docId);
  }

  Future<void> updateBookData(
      String bookAuthor, String bookTitle, String bookDescription) async {
    var docRef = FirestoreService().bookCollection.doc();
    print('update docRef:' + docRef.id);

    await bookCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'author': bookAuthor,
      'title': bookTitle,
      'description': bookDescription
    });
  }

  Future<void> deleteBookDoc() async {
    await bookCollection.get().then((snapshot) {
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
