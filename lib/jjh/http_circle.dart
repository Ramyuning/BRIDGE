import 'package:flutter/material.dart';

class Http_Circle extends StatefulWidget {
  const Http_Circle({super.key});

  @override
  State<Http_Circle> createState() => _Http_CircleState();
}

class _Http_CircleState extends State<Http_Circle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Center(child: Text("잠시만요,,, 금방 대요..",style: TextStyle(color: Colors.white,fontSize: 20),),
        ),),
    );
  }
}
