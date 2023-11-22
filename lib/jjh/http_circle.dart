import 'package:flutter/material.dart';

class Http_Circle extends StatelessWidget {
  const Http_Circle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: Center(child: Text("잠시만용 ㅠㅠ",style: TextStyle(color: Colors.white,fontSize: 17),),),
      ),
    );
  }
}