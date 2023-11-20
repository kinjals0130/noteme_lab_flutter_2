import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../common/common.dart';
import '../model/note_model.dart';
import '../services/note_service.dart';

class AddNote extends StatefulWidget{
  final Note? note;

  const AddNote({
  Key? key,
  this.note,
  }): super (key: key);

  @override
  State<AddNote> createState() => _AddNoteState();

}

class _AddNoteState extends State<AddNote>{

  final GlobalKey<FormState> _formKey = GlobalKey();

  final titleController = TextEditingController();
  final descController = TextEditingController();

  final titleFoc = FocusNode();
  final descFoc = FocusNode();

  @override
  void initState(){
    super.initState();
    if(widget.note !=null){
      titleController.text = widget.note!.title;
      descController.text = widget.note!.desc;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.note != null ? const Text('Update Note') : const Text ('New note'),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            AppTextField(
              textFieldType: TextFieldType.OTHER,
              controller:titleController,
              isValidationRequired: true,
              focus: titleFoc,
              nextFocus: descFoc,
              decoration: inputDecoration(context, labelText: 'Note Title'),
            ),
            20.height,
            AppTextField(
                textFieldType: TextFieldType.MULTILINE,
              controller: descController,
              isValidationRequired: true,
              focus: descFoc,
              decoration: inputDecoration(context, labelText: 'Note Description'),
              maxLines: 5,
              minLines: 3,
            ),
            50.height,
            AppButton(
              text: widget.note != null ? 'Update' : 'Save',
              color: Colors.green,
              textStyle: const TextStyle(fontSize: 20.0, color: Colors.white),
              width: context.width() - context.navigationBarHeight,
              onTap: (){
                if (!_formKey.currentState!.validate()) return;
                if(titleController.text.isEmpty){
                  return toastLong('Title is required');
                }

                final note = Note(
                  title: titleController.text.validate(),
                  desc: descController.text.validate(),
                  createdTime: DateTime.now(),
                );
                noteService.addNote(note).then((value){
                  toastLong('Note Added Successfully');
                  finish(context, true);
                });
              },
            )
          ],
        ).paddingSymmetric(horizontal: 15, vertical: 20),
      )
    );
  }



}