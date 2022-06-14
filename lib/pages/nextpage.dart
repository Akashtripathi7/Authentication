import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 1, 16, 27),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[Colors.greenAccent, Colors.lightBlueAccent]),
          ),
        ),
        // backgroundColor: Color(0xff84ACFA),
        title: const Text(
          'CorpusVision',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        child: Text(
          "HELLO  \nWelcome to CorpusVision",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
