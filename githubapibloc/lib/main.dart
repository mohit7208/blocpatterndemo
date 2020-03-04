import 'package:flutter/material.dart';
import './src/ui/user_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Api ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
        primaryColorDark: Colors.blue[800],
        primaryColor: Colors.blue,
      ),
      home: UserList(),
    );
  }
}