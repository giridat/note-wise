import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:note_project/style/app_style_dark.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: DarkMode.cardsColor[doc['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
            style: DarkMode.mainTitle,
            maxLines: 1,
          ),
          const SizedBox(height: 4.0,),
          Text(
            doc["creation_date"],
            style: DarkMode.dateTitle,
          ),
          const SizedBox(height: 4.0,),
          Text(
            doc["note_content"],
            style: DarkMode.mainContent,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
