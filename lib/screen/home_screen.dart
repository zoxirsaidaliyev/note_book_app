// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:note_book_app/provider_model/model.dart';
import 'package:note_book_app/screen/add_note_screen.dart';
import 'package:note_book_app/screen/notes_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8EEE2),
      body: Consumer<ProviderModel>(builder: (context, value, child) {
        if (value.data.isEmpty) {
          return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                SafeArea(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('img/vektor.png'),
                    SizedBox(width: 30),
                    Text(
                      'All Notes',
                      style: TextStyle(
                        color: Color(0xFF403B36),
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(width: 30),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                    )
                  ],
                ),
                SizedBox(height: 130),
                Center(child: Image.asset('img/home.png')),
                SizedBox(height: 39),
                Text('Create Your First Note',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF403B36),
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    )),
                SizedBox(height: 5),
                SizedBox(
                    width: 314,
                    child: Text('Add a note about anything (your thoughts on climate change, or your history essay) and share it witht the world.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF595550),
                          fontSize: 16,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ))),
                SizedBox(height: 77),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Color(0xFFD9614C)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),
                      minimumSize: MaterialStatePropertyAll(Size(319, 74)),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddNoteScreen()));
                    },
                    child: Text('Create A Note',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFFFFBFA),
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ))),
                SizedBox(height: 25),
                Center(
                    child: Text('Import Notes',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFD8614B),
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        )))
              ]));
        } else {
          return NoteScreen();
        }
      }),
    );
  }
}
