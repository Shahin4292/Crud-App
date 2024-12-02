import 'package:crud_getx/model/notes_model.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
  RxList<NotesModel> notes = <NotesModel>[].obs;

  addNote(NotesModel notesData) {
    notes.add(notesData);
  }

  deleteNote(int index) {
    notes.removeAt(index);
  }
}
