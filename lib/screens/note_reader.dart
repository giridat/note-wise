import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_project/style/app_style.dart';
import 'package:note_project/data/note_data.dart';
import 'package:note_project/data/providers/firebase_provider.dart';

class NoteReaderScreen extends StatefulWidget {
  NoteReaderScreen(this.doc, {Key? key}) : super(key: key);
  QueryDocumentSnapshot doc;

  @override
  State<NoteReaderScreen> createState() => _NoteReaderScreenState();
}

class _NoteReaderScreenState extends State<NoteReaderScreen> {
  final Stream<QuerySnapshot> noteStream =
      FirebaseFirestore.instance.collection('Notes').snapshots();
  CollectionReference notes = FirebaseFirestore.instance.collection('Notes');

  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc["color_id"];
    // String date = DateTime.now().toString();
    // TextEditingController _titleController = TextEditingController();
    // TextEditingController _mainController = TextEditingController();

    return StreamBuilder<QuerySnapshot>(
        stream: noteStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Scaffold(
            backgroundColor: AppStyle.cardsColor[color_id],
            appBar: AppBar(
                title: const Text(
                  "Back",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                backgroundColor: AppStyle.cardsColor[color_id],
                elevation: 0.0,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => {},
                  ),
                ]),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.doc["note_title"],
                    style: AppStyle.mainTitle,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    widget.doc["creation_date"],
                    style: AppStyle.dateTitle,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    widget.doc["note_content"],
                    style: AppStyle.mainContent,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: Colors.amber,
              onPressed: () {
                FirebaseFirestore.instance
                    .collection('Notes')
                    .doc(widget.doc.id)
                    .delete()
                    .whenComplete(() => {print("Note Deleted Successfully")});
                    Navigator.pop(context);
              },
              label: const Text(
                "Delete",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              icon: const Icon(
                Icons.delete,
                size: 35,
                // color: Colors.amber,
              ),
            ),
          );
          // return Text(
          //   "404"
          // );
        }
        // return const SizedBox();
        // },

        );
  }
}
