import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  Widget yesButton = TextButton(
    child: const Text("Yes",style: TextStyle(fontWeight: FontWeight.bold),),
    onPressed: () async {
      var collection = FirebaseFirestore.instance.collection('Notes');
      var snapshots = await collection.get();
      for (var doc in snapshots.docs) {
        await doc.reference.delete();
      }
      Navigator.pop(context);
    },
  );
  Widget noButton = TextButton(
    onPressed: () {
      Navigator.pop(context);
    },
    child: const Text("No",style: TextStyle(fontWeight: FontWeight.bold),),
  );

  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.amber,
    title: Text("Caution!"),
    content: const Text("Are you sure you want to delete all the notes? This can't be undone!",style: TextStyle(fontWeight: FontWeight.bold),),
    actions: [
      yesButton,
      noButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );

}
