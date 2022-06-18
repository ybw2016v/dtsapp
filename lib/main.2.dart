import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home:  HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

double _value = 0.0;

void _addvalue() {
  setState(() {
    _value += 1.05;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SelectableText('+1'),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SelectableText('你的钱包余额为：'),
          SelectableText('$_value'),
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addvalue,
        child: Icon(Icons.add),
        tooltip: 'Increment',
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
