import 'package:flutter/material.dart';
import 'package:iam/ui/screens/general.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {

  void initState(){
    super.initState();
    navigatetohome();
  }
  navigatetohome()async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>general()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          height: 60,
          width: 80,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ) ,
          child: Center(
            child: Text("I AM",
            style: TextStyle(
              fontSize: 25,
             fontWeight: FontWeight.bold
            ),),
          ),
        ),
      )
    );
  }
}