import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_project/style/app_style_dark.dart';

import '../data/note_data.dart';
import 'home_screen.dart';

class NoteUpdateScreen extends StatefulWidget {
  const NoteUpdateScreen(this.editNote);

  final Note editNote;

  // get doc => QueryDocumentSnapshot ;

  @override
  State<NoteUpdateScreen> createState() => _NoteState();
}

class _NoteState extends State<NoteUpdateScreen> {
  int color_id = Random().nextInt(DarkMode.cardsColor.length);

  String formattedDate =
      DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  late TextEditingController _titleController;
  late TextEditingController _mainController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.editNote.title);
    _mainController = TextEditingController(text: widget.editNote.content);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DarkMode.cardsColor[color_id],
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Center(
            child: Text(
          "Update your Note",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note Title",
              ),
              style: DarkMode.mainTitle,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              formattedDate,
              style: DarkMode.mainTitle,
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note Content",
              ),
              style: DarkMode.mainTitle,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: DarkMode.accentColor,
        onPressed: () async {
          FirebaseFirestore.instance
              .collection('Notes')
              .doc(widget.editNote.docId)
              .update({
            "note_title": _titleController.text,
            "creation_date": formattedDate,
            "note_content": _mainController.text,
            "color_id": color_id
          }).whenComplete(() => {debugPrint("Updated")});
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        },
        child: const Icon(
          Icons.update,
        ),
      ),
    );
  }
}
