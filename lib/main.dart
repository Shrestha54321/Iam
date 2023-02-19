import 'package:flutter/material.dart';
import 'package:iam/ui/screens/general.dart';
import 'package:iam/ui/screens/splash.dart';
import 'package:iam/ui/screens/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I AM',
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        primarySwatch: Colors.grey,
      ),
      home: splash(),
    );
  }
}

