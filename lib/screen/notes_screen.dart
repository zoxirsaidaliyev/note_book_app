import 'package:flutter/material.dart';
import 'package:note_book_app/provider_model/model.dart';
import 'package:note_book_app/screen/add_note_screen.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF8EEE2),
        elevation: 0,
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image.asset('img/vektor.png'),
          const SizedBox(width: 30),
          const Text('Recent Notes',
              style: TextStyle(
                color: Color(0xFF403B36),
                fontSize: 14,
                fontWeight: FontWeight.w900,
              )),
          const SizedBox(width: 30),
          const Icon(Icons.search, color: Colors.black)
        ]),
      ),
      backgroundColor: Color(0xFFF8EEE2),
      body: Consumer<ProviderModel>(
        builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SafeArea(child: SizedBox()),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.all(15),
                      padding: EdgeInsets.all(10),
                      decoration: ShapeDecoration(
                          color: Color(0xFFFFFDFA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Colors.white),
                          )),
                      child: ListTile(
                        title: Text(
                          value.data[index].title,
                          style: TextStyle(
                            color: Color(0xFF595550),
                            fontSize: 16,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        subtitle: Text(
                          value.data[index].subtitle,
                          style: TextStyle(
                            color: Color(0xFF595550),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              context.read<ProviderModel>().getRemove(value.data[index]);
                            },
                            icon: Icon(Icons.delete_sharp)),
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog();
                              });
                        },
                      ),
                    ),
                  ],
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNoteScreen()));
        },
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Color(0xFFF8EEE2),
        elevation: 0,
      ),
    );
  }
}
