import 'package:flutter/material.dart';
import 'pages/rootPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        highlightColor: Color.fromRGBO(1, 0, 0, 0.0),
        splashColor: Color.fromRGBO(1, 0, 0, 0.0),
        cardColor: Colors.green,
      ),
      home: RootPage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.green,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '微信',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: '通讯录',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '发现',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '我',
          ),
        ],
      ),
    );
  }
}
