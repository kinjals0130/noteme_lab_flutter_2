import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../screens/add_note.dart';
import '../screens/note_screen.dart';
import '../services/note_service.dart';
import '../model/note_model.dart';

//
class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState  extends State<Home>{

  //create a notes list variable
  late List<Note> notesList;

  @override
  void initState(){
    super.initState();
    //get all notes on initiale startup
    notesList = noteService.getNotes();
  }

  //on refresh get all the notes
  Future<void> refresh(){
    if(notesList.isNotEmpty){
      notesList.clear();
    }

    notesList = noteService.getNotes();
    setState(() {

    });

    return Future.delayed(200.milliseconds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Me'),
        centerTitle: true,
        titleTextStyle: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          const AddNote()
              .launch(context, pageRouteAnimation: PageRouteAnimation.Fade)
              .then((value){
                refresh();
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: AnimatedListView(
        itemCount: notesList.length,
        onSwipeRefresh: () => refresh(),
        emptyWidget: const Center(
          child: Text("No Notes Found", style: TextStyle(fontSize: 20.0)),
        ),
        itemBuilder: (p0, index){
          final note = notesList[index];

          return Column(
            children: [
              ListTile(
                onTap: () => NoteScreen(note: note)
                    .launch(context, pageRouteAnimation: PageRouteAnimation.Fade)
                    .then((value){
                      refresh();
                }),
                title: Text(note.title, style: boldTextStyle()),
                subtitle: Text(
                  note.desc,
                  style: primaryTextStyle(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                isThreeLine: note.desc.length > 20,
              ),
              if(index < (notesList.length -1)) const Divider(),
            ],
          );
        },
      ).paddingSymmetric(horizontal: 15, vertical: 10),
    );
  }

}