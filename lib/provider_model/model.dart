import 'package:flutter/material.dart';

class ProviderModel extends ChangeNotifier {
  List<Note> data = [];
  getAdd(Note note) {
    data.add(note);
    notifyListeners();
  }

  getRemove(Note note) {
    data.remove(note);
    notifyListeners();
  }

  getChange(int index, Note note) {
    data.removeAt(index);
    data.insert(index, note);
    notifyListeners();
  }
}

class Note {
  final String title;
  final String subtitle;
  Note({required this.title, required this.subtitle});
}
