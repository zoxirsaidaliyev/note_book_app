import 'package:flutter/material.dart';
import 'package:note_book_app/provider_model/model.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    TextEditingController controller2 = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFF8EEE2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SafeArea(child: SizedBox()),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
              const SizedBox(width: 30),
              const Text('Edit Notes',
                  style: TextStyle(
                    color: Color(0xFF403B36),
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  )),
              const SizedBox(width: 30),
              Image.asset('img/more-ver.png'),
            ]),
            const SizedBox(height: 30),
            SizedBox(
                width: 400,
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      maxLines: 1,
                      controller: controller,
                      decoration: InputDecoration(enabledBorder: InputBorder.none),
                    ))),
            SizedBox(
                width: 400,
                height: 800,
                child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      maxLines: 100,
                      controller: controller2,
                      decoration: InputDecoration(enabledBorder: InputBorder.none),
                    ))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProviderModel>().getAdd(Note(title: controller.text, subtitle: controller2.text));
          Navigator.pop(context);
        },
        child: Icon(Icons.done, color: Colors.black),
        backgroundColor: Color(0xFFF8EEE2),
        elevation: 0,
      ),
    );
  }
}
