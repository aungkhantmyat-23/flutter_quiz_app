import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/views/create_quiz.dart';
import 'package:flutter_quiz_app/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Container(
        child: Column(
          children: [

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreateQuiz()
              ),
          );
        },
      ),
    );
  }
}
