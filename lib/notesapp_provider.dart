import 'package:flutter/cupertino.dart';
import 'package:provider_notes_app_practice/dbhelper.dart';
import 'package:provider_notes_app_practice/notesmodel.dart';

class NotesProvider extends ChangeNotifier {
  List<NotesModel>arrNotes = [];
  DbHelper db = DbHelper.db;

   addNotes(NotesModel notesModel) async {
    var check = await db.addNotes(notesModel);
    if(check) {
      arrNotes=await db.fetchNotes();
      notifyListeners();


    }
  }
  List<NotesModel>getNotes(){
     fetchInitialNotes();
     return arrNotes;
  }
  fetchInitialNotes()async{
    arrNotes=await db.fetchNotes();
    notifyListeners();

  }

}