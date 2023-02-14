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

  Future<void> updateReservationData(
      String reservationDate,
      String reservationPax,
      String reservationOccasion,
      String reservationId) async {
    await reservationCollection.doc(reservationId).update({
      'uid': reservationId,
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
