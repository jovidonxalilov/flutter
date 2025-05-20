import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationService {
  final CollectionReference _collection = FirebaseFirestore.instance.collection('salom');

  Future<void> sending(String title) async {
    await _collection.add({'title': title});
  }
}
