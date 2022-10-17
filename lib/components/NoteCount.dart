import 'package:flutter/material.dart';

class NoteCount extends StatefulWidget {
  const NoteCount({Key? key}) : super(key: key);

  @override
  State<NoteCount> createState() => _NoteCountState();
}

class _NoteCountState extends State<NoteCount> {
  List <int> notes = [500,100,50,20,10,5,2,1];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Flexible(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(notes.length, (index) {
              return Text(notes[index].toString());
            }),
        ),
      )
    );
  }
}
