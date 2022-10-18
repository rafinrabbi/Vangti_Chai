import 'package:flutter/material.dart';
import 'package:vangti_chai/components/NoteCount.dart';
import 'package:vangti_chai/components/keypad.dart';
import 'package:flutter/services.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.landscapeRight]
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(title: 'Vangi Chai'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String taka = "0";

  void addNumber(String num)  {
    if(taka == "0"){
      if(num != "0"){
        taka = num;
      }
    }else{
      taka += num;
    }

    setState(() {

    });
  }

  void allClear() {
    setState(() {
      taka = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Taka " + taka, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),

            Row(
              children: [
                NoteCount(taka: taka,),
                SizedBox(width: 20),
                Keypad(addDigit: addNumber, allClear: allClear,)
                // NoteCount(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
