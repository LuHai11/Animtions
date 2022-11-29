import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'animation'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double startposition = 600.0;
  double planeposition = 0.0;
  static const IconData flight = IconData(0xe297, fontFamily: 'MaterialIcons');
  void _planeup(){
    setState(() {
      planeposition-=20;
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Center(
        child: Column(
        children: <Widget>[
          AnimatedContainer(
            padding: EdgeInsets.only(top:startposition-20),
            child: Icon(flight),
              height: 0-planeposition,
              duration:const Duration(seconds: 2)
          ),
          Container(
            padding: EdgeInsets.only(top:startposition),
          child:
          ElevatedButton.icon(
              onPressed: (){_planeup();},
              icon: Icon(flight),
              label: Text("起飛")
          )
          ),
        ],
      ),
    )
    );
  }
}
