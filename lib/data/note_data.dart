import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String docId;
  final String content;
  Note({required this.docId, required this.content});

  factory Note.fromDoc (DocumentSnapshot doc){
    return Note(
      docId: doc.id,
      content: doc.data().toString(),
    );
  }
}