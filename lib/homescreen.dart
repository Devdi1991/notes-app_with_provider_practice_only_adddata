import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_notes_app_practice/notesapp_provider.dart';
import 'package:provider_notes_app_practice/notesmodel.dart';
import 'package:provider_notes_app_practice/uihelper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var titlecontroller=TextEditingController();
  var desccontroller=TextEditingController();
  addNotes1(String title,String desc){
    context.read<NotesProvider>().addNotes(NotesModel(title: title, description: desc));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotesApp",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        ),
        centerTitle: true,
      ),
      body: Consumer<NotesProvider>(
        builder: (_,provider,__){
          return ListView.builder(itemBuilder:(context,index){
            var currentData=provider.getNotes()[index];
            return ListTile(
              leading: CircleAvatar(child: Text("${currentData.noteid.toString()}"),),
              title: Text("${currentData.title.toString()}"),
              subtitle: Text("${currentData.description.toString()}"),
              trailing: IconButton(onPressed: (){

              }, icon: Icon(Icons.delete)),
            );
          },
            itemCount:provider.getNotes().length ,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _bottomSheet();

      },
        child:Icon(Icons.add) ,),
    );

  }
  _bottomSheet(){
    showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          )
        ),
        child: Column(
          children: [
            Uihelper.CustomTextField(titlecontroller, "Enter title", Icons.title),
            Uihelper.CustomTextField(desccontroller, "Enter description", Icons.description),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
addNotes1(titlecontroller.text.toString(), desccontroller.text.toString());
titlecontroller.clear();
desccontroller.clear();
            },
              child: Text("Add data"),
            ),
          ],
        ),
      );

    }
    );
  }
}

