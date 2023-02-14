import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_redo/model/feedback.dart';

class FirestoreService {
  final CollectionReference feedbackCollection =
      FirebaseFirestore.instance.collection('feedback');

  Future<void> addFeedbackData(
      String feedbackfood, String feedbackcs, String feedbackimprove) async {
    var docRef = FirestoreService().feedbackCollection.doc();
    print('add docRef:' + docRef.id);

    await feedbackCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'food': feedbackfood,
      'customer service': feedbackcs,
      'improvement': feedbackimprove,
    });
  }

  Future<List<Feedback>> readFeedbackData() async {
    List<Feedback> feedbackList = [];
    QuerySnapshot snapshot = await feedbackCollection.get();

    snapshot.docs.forEach((document) {
      Feedback reservation = Feedback.fromMap(document.data());
      feedbackList.add(reservation);
    });

    print('Feedbacklist: $feedbackList');
    return feedbackList;
  }

  Future<void> deleteFeedbackData(String docId) async {
    feedbackCollection.doc(docId).delete();

    print('deleting uid: ' + docId);
  }

  Future<void> updateFeedbackData(
      String feedbackfood, String feedbackcs, String feedbackimprove) async {
    var docRef = FirestoreService().feedbackCollection.doc();
    print('add docRef:' + docRef.id);

    await feedbackCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'food': feedbackfood,
      'customer service': feedbackcs,
      'improvement': feedbackimprove,
      // 'location': bookDescription
    });
  }

  Future<void> deleteFeedbackDoc() async {
    await feedbackCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }
}
