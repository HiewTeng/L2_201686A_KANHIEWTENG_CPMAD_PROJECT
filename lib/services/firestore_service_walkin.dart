import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_redo/model/walkin.dart';

class FirestoreService {
  final CollectionReference walkInCollection =
      FirebaseFirestore.instance.collection('walkIn');

  Future<void> addWalkInData(
      String walkinName, String walkinPhoneNo, String wakinPax) async {
    var docRef = FirestoreService().walkInCollection.doc();
    print('update docRef:' + docRef.id);

    await walkInCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'name': walkinName,
      'phoneno': walkinPhoneNo,
      'pax': wakinPax,
    });
  }

  Future<List<WalkIn>> readWalkInData() async {
    List<WalkIn> walkInList = [];
    QuerySnapshot snapshot = await walkInCollection.get();

    snapshot.docs.forEach((document) {
      WalkIn walkIn = WalkIn.fromMap(document.data());
      walkInList.add(walkIn);
    });

    print('walkInList: $walkInList');
    return walkInList;
  }

  Future<void> deleteWalkInData(String docId) async {
    walkInCollection.doc(docId).delete();

    print('deleting uid: ' + docId);
  }

  Future<void> updateWalkInData(
      String walkinName, String walkinPhoneNo, wakinPax) async {
    var docRef = FirestoreService().walkInCollection.doc();
    print('update docRef:' + docRef.id);

    await walkInCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'name': walkinName,
      'phoneno': walkinPhoneNo,
      'pax': wakinPax,
      // 'location': bookDescription
    });
  }

  Future<void> deleteWalkInDoc() async {
    await walkInCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  }
}
