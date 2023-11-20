import 'package:nb_utils/nb_utils.dart';
import 'package:noteme_flutter_2/model/note_model.dart';


const note_list = 'noteList';

class NoteService {

  //add a new note to the list
  Future<bool> addNote(Note note) async {
    final oldNotesList = getStringListAsync(note_list);
    if (oldNotesList.validate().isNotEmpty) {
      final oldNoteList = oldNotesList!.map((d) => Note.fromJson(d)).toList();

      final newList = [note, ...oldNoteList];
      return setValue(note_list, newList.map((d) => d.toJson()).toList());
    } else {
      final newList = [note];
      return setValue(note_list, newList.map((d) => d.toJson()).toList());
    }
  }

  //remove a note from the list
  Future<bool> removeNote(Note note) {
    final oldNotes = getStringListAsync(note_list);
    final noteList = oldNotes!.map((d) => Note.fromJson(d)).toList();

    //remove from the list where the title, desc and created time match
    noteList.removeWhere((d) =>
        d.title == note.title &&
        d.desc == note.desc &&
        d.createdTime == note.createdTime);
    return setValue(note_list, noteList.map((d) => d.toJson()).toList());
  }

  //get all notes from the note list
  List<Note> getNotes() {
    final oldNotes = getStringListAsync(note_list);
    if (oldNotes.validate().isEmpty) return List.empty();

    return oldNotes!.map((e) => Note.fromJson(e)).toList();
  }
}

final NoteService noteService = NoteService();


