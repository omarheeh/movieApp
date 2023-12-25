import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreServes {
  FirebaseFirestoreServes(this.firebaseFirestore);
  final FirebaseFirestore firebaseFirestore;
  Future<void> post(
      {required String collection, required Map<String, dynamic> body}) {
    CollectionReference request = firebaseFirestore.collection(collection);
    return request.add(body);
  }

  Future<dynamic> get(
      {required String collection, required String where}) async {
    CollectionReference request = firebaseFirestore.collection(collection);
    var data = await request.where('userEmail', isEqualTo: where).get();
    return data.docs;
  }

  Future<void> delete(
      {required String collection, required String docId}) async {
    CollectionReference request = firebaseFirestore.collection(collection);
    request.doc(docId).delete();
  }

  Future<Map<String, dynamic>> getUser(
      {required String collection, required String emailAddress}) async {
    var user = await FirebaseFirestore.instance
        .collection(collection)
        .where('email', isEqualTo: emailAddress)
        .get();

    return user.docs.first.data();
  }
}
