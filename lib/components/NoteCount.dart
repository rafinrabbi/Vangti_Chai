import 'package:flutter/material.dart';

class NoteCount extends StatefulWidget {
  // const NoteCount({Key? key, }) : super(key: key);
  final String taka;
  List<Map> notes = [
    {"amount" : 500, "count" : 0 },
    {"amount" : 100, "count" : 0 },
    {"amount" : 50, "count" : 0 },
    {"amount" : 20, "count" : 0 },
    {"amount" : 10, "count" : 0 },
    {"amount" : 5, "count" : 0 },
    {"amount" : 2, "count" : 0 },
    {"amount" : 1, "count" : 0 }

  ];
  NoteCount({required this.taka});

  @override
  State<NoteCount> createState() => _NoteCountState();
}

class _NoteCountState extends State<NoteCount> {


  void calculation(){
    num takaInt = int.parse(widget.taka);
    for(var i = 0; i < widget.notes.length; i++){
      if(takaInt != 0){
        widget.notes[i]["count"] = takaInt~/widget.notes[i]["amount"];
        takaInt = takaInt % widget.notes[i]["amount"];
        print(takaInt);
      }

    }

  }

  @override
  Widget build(BuildContext context) {
    calculation();
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    List<Widget> left = [];
    for (var i = 0; i <4 ; i++){
      left.add(Container(
        padding: const EdgeInsets.all(10),
        child: Text(widget.notes[i]["amount"].toString()+" : "+widget.notes[i]["count"].toString()),
      ));

    }

    List<Widget> right = [];
    for (var i = 4; i <widget.notes.length ; i++) {
      right.add(Container(
        padding: const EdgeInsets.all(10),
        child: Text(widget.notes[i]["amount"].toString() + " : " +
            widget.notes[i]["count"].toString()),
      ));
    }
    if(isPortrait){
      return Container(
          padding: const EdgeInsets.all(28),
          child: Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(widget.notes.length, (index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                      widget.notes[index]["amount"].toString()+" : "+widget.notes[index]["count"].toString()),
                );
              }),
            ),
          )
      );
    }else{
      return Container(
          padding: const EdgeInsets.all(28),
          child: Flexible(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: left,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: right,
                ),
              ],
            ),


          )
      );
    }

  }
}
