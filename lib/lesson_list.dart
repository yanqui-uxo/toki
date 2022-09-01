import 'package:flutter/material.dart';

class LessonList extends StatefulWidget {
  const LessonList({Key? key}) : super(key: key);

  @override
  State<LessonList> createState() => _LessonListState();
}

class _LessonListState extends State<LessonList> {
  int? selectedIndex;

  void select(int idx) {
    selectedIndex = idx != selectedIndex ? idx : null;
  }

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "mi, sina, ona, and li",
      "Basic modifiers",
      "Verb objects"
    ];

    List<Widget> children = [];
    for (int i = 0; i < titles.length; i++) {
      children.add(ListTile(
          title: Text("Lesson $i: ${titles[i]}"),
          selected: selectedIndex == i,
          onTap: () => setState(() => select(i))));
    }

    return ListView(children: children);
  }
}
