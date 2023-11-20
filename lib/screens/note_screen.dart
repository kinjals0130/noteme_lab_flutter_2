import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../model/note_model.dart';
import '../services/note_service.dart';

//when user clicks on a note from the list
class NoteScreen extends StatelessWidget {
  final Note note;

  const NoteScreen({
    Key? key,
    required this.note,
  }) : super(key: key);



  //user can delete a note when clicked on a specific note
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
        actions: [
          IconButton(
            onPressed: () {
              //user is prompted to ensrue they would like to delete the selected note
              showConfirmDialogCustom(
                context,
                title: 'Remove Note',
                subTitle: 'Are you sure you want to remove ${note.title}?',
                dialogType: DialogType.DELETE,
                onAccept: (s) {
                  noteService.removeNote(note).then((value) {
                    toastLong('Note Removed Successfully');
                    finish(context);
                  });
                },
              );
            },
            icon: const Icon(CupertinoIcons.trash),
          )
        ],
      ),
      body: Column(
        children: [
          Text(
            note.desc,
            style: primaryTextStyle(),
            textAlign: TextAlign.justify,
          ),
        ],
      ).paddingSymmetric(horizontal: 25, vertical: 20),
    );
  }
}
