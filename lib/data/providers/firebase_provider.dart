import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProviderForNotes {

  Future<void> delete(String id) async {
    final collection = FirebaseFirestore.instance.collection('Notes');
    await collection.doc(id).delete();
  }

// ... add function for fetch...
//
// ... add function for edit...
//
// etc... as many function as you want
}