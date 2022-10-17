import 'package:flutter/material.dart';

class Keypad extends StatefulWidget {
  final Function addDigit;

  const Keypad({required this.addDigit});

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
              ElevatedButton(onPressed: (){widget.addDigit("5");}, child: Text('1')),
              ElevatedButton(onPressed: null, child: Text('2')),
              ElevatedButton(onPressed: null, child: Text('3'))
            ],
          ),
          Row(
            children: [
              ElevatedButton(onPressed: null, child: Text('4')),
              ElevatedButton(onPressed: null, child: Text('5')),
              ElevatedButton(onPressed: null, child: Text('6'))
            ],
          ),
          Row(
            children: [
              ElevatedButton(onPressed: null, child: Text('7')),
              ElevatedButton(onPressed: null, child: Text('8')),
              ElevatedButton(onPressed: null, child: Text('9'))
            ],
          ),
          Row(
            children: [
              ElevatedButton(onPressed: null, child: Text('0')),
              ElevatedButton(onPressed: null, child: Text('clear')),
              // ElevatedButton(onPressed: null, child: Text('9'))
            ],
          )
        ],
      ),
    );
  }
}
