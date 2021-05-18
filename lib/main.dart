import 'package:flutter/material.dart';
import 'package:form_user/Pages/FormUser/form_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form User',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormUser(),
    );
  }
}
