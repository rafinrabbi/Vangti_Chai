import 'package:flutter/material.dart';

class Keypad extends StatefulWidget {
  final Function addDigit;
  final Function allClear;
  const Keypad({required this.addDigit, required this.allClear});

  @override
  State<Keypad> createState() => _KeypadState();
}

class _KeypadState extends State<Keypad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children:  [
              ElevatedButton(onPressed: (){widget.addDigit("1");}, child: Text('1')),
              SizedBox(width: 10),
              ElevatedButton(onPressed: (){widget.addDigit("2");}, child: Text('2')),
              SizedBox(width: 10),
              ElevatedButton(onPressed: (){widget.addDigit("3");}, child: Text('3'))
            ],
          ),
          Row(
            children: [
              ElevatedButton(onPressed: (){widget.addDigit("4");}, child: Text('4')),
              SizedBox(width: 10),
              ElevatedButton(onPressed: (){widget.addDigit("5");}, child: Text('5')),
              SizedBox(width: 10),
              ElevatedButton(onPressed: (){widget.addDigit("6");}, child: Text('6'))
            ],
          ),
          Row(
            children: [
              ElevatedButton(onPressed: (){widget.addDigit("7");}, child: Text('7')),
              SizedBox(width: 10),
              ElevatedButton(onPressed: (){widget.addDigit("8");}, child: Text('8')),
              SizedBox(width: 10),
              ElevatedButton(onPressed: (){widget.addDigit("9");}, child: Text('9'))
            ],
          ),
          Container(
            width: 210,
            height: 35,
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Container(

                      child: ElevatedButton(onPressed: (){widget.allClear();}, child: Text('Clear'))
                  ),

                ),
                SizedBox(width: 10,),
                Expanded(
                  flex: 4,
                  child:  Container(

                      child: ElevatedButton(onPressed: (){widget.addDigit("0");}, child: Text('0'))
                  ),

                ),
                // ElevatedButton(onPressed: null, child: Text('9'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
