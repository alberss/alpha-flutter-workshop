import 'package:alpha_flutter_workshop/src/screens/screens.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BcnRust Organization members',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MyHomeScreen(),
    );
  }
}
