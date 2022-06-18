

import 'package:flutter/material.dart';

import 'widget/webinfo.dart';
import 'widget/about.dart';
import 'widget/chouti.dart';
import 'widget/dogadd.dart';
import 'widget/setting.dart';

import 'tool/doghouse.dart';



// import 'package:english_words/english_words.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_application_1/main.2.dart';

// import "widget/doghead.dart";
// import "widget/webinfo.dart";



void main() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    WidgetsFlutterBinding.ensureInitialized();
    await Doghouse.init();
    
    runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'DTS App',
      home: const Home(),
      routes: {
        '/home': (context) =>   const HomePage(),
        '/about': (context) =>  const Dogabout(),
        '/add':((context) => const Addpage()),
        '/settings':((context) => const SetPage()),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime? _lastPressedAt;
    @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) > const Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          const snkb = SnackBar(content: Text("再按一次退出"));
          ScaffoldMessenger.of(context).showSnackBar(snkb);
          return false;
          
        }
        return true;
      },
      child: const HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Chouti(),
      body: NestedScrollView(
          headerSliverBuilder: _sliverBuilder,
          body: const WebInfo(),));

    // return Scaffold(
    //     appBar: AppBar(
    //       title: const SelectableText('DTS APP'),
    //     ),
    //     body: const WebInfo(),);
  }

List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
  return <Widget>[
     SliverAppBar(
      // centerTitle: true, //标题居中
      // expandedHeight: 200.0, //展开高度200
      // backgroundColor: Colors.tealAccent,
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          tooltip: 'Add',
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          tooltip: 'Settings',
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ],
      floating: false, //不随着滑动隐藏标题
      pinned: false, //不固定在顶部
      title: const SelectableText('DTS APP'),
      ),
      
    
  ];
}

}





