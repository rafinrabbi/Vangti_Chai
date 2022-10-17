// import 'package:flutter/material.dart';
// import 'package:vangti_chai/components/NoteCount.dart';
// import 'package:vangti_chai/components/keypad.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home:  MyHomePage(title: 'Vangi Chai'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   String taka = "0";
//
//   void addNumber(String num)  {
//     if(taka == "0"){
//       if(num != "0"){
//         taka = num;
//       }
//     }else{
//       taka += "num";
//     }
//
//     setState(() {
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Text("Taka " + taka),
//             Row(
//               children: [
//                 NoteCount(),
//                 Keypad(addDigit: addNumber,)
//                 // NoteCount(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:vangti_chai/components/NoteCount.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AddDigits(),
      ),
    );
  }
}

class AddDigits extends StatefulWidget {
  @override
  _AddDigitsState createState() => _AddDigitsState();
}

class _AddDigitsState extends State<AddDigits> {
  String _total = '0.00';
  String _tmp = '';

  addDigit(int value) {
    if (_tmp.indexOf('0') == 0) _tmp = _tmp.substring(1, _tmp.length);
    setState(() {
      _tmp += value.toString();
      if (_tmp.length == 1) _total = '0.0' + _tmp.toString();

      if (_tmp.length == 2) _total = '0.' + _tmp.toString();

      if (_tmp.length > 2) {
        _total = _tmp.substring(0, _tmp.length - 2) +
            '.' +
            _tmp.substring(_tmp.length - 2);
      }
    });
  }

  removeDigit() {
    var _tmpValue = _total;
    if (_tmpValue.length > 3) {
      var _fortmp = _tmpValue.substring(0, _tmpValue.length - 3) +
          _tmpValue.substring(_tmpValue.length - 2);
      _fortmp = _fortmp.substring(0, _fortmp.length - 1);
      _tmpValue = _fortmp.substring(0, _fortmp.length - 2) +
          '.' +
          _fortmp.substring(_fortmp.length - 2);
      setState(() {
        _total = _tmpValue;
        _tmp = _fortmp;
      });
    }

    if (_tmpValue.length == 3) {
      _tmpValue = _tmpValue.substring(_tmpValue.length - 2);
      setState(() {
        _total = '0.' + _tmpValue;
        if (_tmp == '00')
          _tmp = '';
        else
          _tmp = _tmpValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          NoteCount(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("Total: " + _total.toString())],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NumKey(
                value: 1,
                callBack: addDigit,
              ),
              NumKey(value: 2, callBack: addDigit),
              NumKey(value: 3, callBack: addDigit),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NumKey(value: 4, callBack: addDigit),
              NumKey(value: 5, callBack: addDigit),
              NumKey(value: 6, callBack: addDigit),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NumKey(value: 7, callBack: addDigit),
              NumKey(value: 8, callBack: addDigit),
              NumKey(value: 9, callBack: addDigit),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: MaterialButton(
                  child: Image.asset(
                    'assets/delete.png',
                    width: 45.0,
                    height: 55.0,
                  ),
                  onPressed: () => {removeDigit()},
                ),
              ),
              NumKey(value: 0, callBack: addDigit),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: MaterialButton(
                  child: Image.asset('assets/success.png',
                      width: 25.0, height: 25.0),
                  onPressed: () => {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NumKey extends StatelessWidget {
  final int value;
  Function callBack;

  NumKey({required this.value, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        // backgroundColor: Colors.redAccent,
        child: Text(value.toString(),
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center),
        onPressed: () => {callBack(value)},
      ),
    );
  }
}
