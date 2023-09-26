import 'package:provider_notes_app_practice/dbhelper.dart';
import 'package:provider_notes_app_practice/homescreen.dart';

import 'dbhelper.dart';

class NotesModel {
  int? noteid;
  String title;
  String description;
  NotesModel({this.noteid, required this.title, required this.description});
  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
        title: map[DbHelper.Note_Columntitle],
        description: map[DbHelper.Note_desc],
        noteid: map[DbHelper.Note_Columnid]);
  }
  Map<String,dynamic>toMap(){
    return {
      DbHelper.Note_Columnid:noteid,
      DbHelper.Note_Columntitle:title,
      DbHelper.Note_desc:description


    };
  }
}
