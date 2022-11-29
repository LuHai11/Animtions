import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'airplanaAnimation';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static const IconData flight = IconData(0xe297, fontFamily: 'MaterialIcons');
  double padValue = -0.15;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
    });
  }
  void _downdatePadding() {
    setState(() {
      padValue = -0.15;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        AnimatedContainer(duration: Duration(seconds:3),
          alignment:Alignment(0, padValue),
          onEnd: _downdatePadding,
          curve: Curves.easeOutQuart,
          child:Container(child:Icon(flight)),
        ),
        ElevatedButton.icon(
          onPressed: (){
            _updatePadding(padValue == -0.15 ? -1.0 : -0.15);
          },
          icon:Icon(flight,color: Colors.white),
          label: Text('起飛'),
        ),
      ],
    );
  }
}

