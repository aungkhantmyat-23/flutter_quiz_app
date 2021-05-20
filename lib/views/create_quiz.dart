import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/service/database.dart';
import 'package:flutter_quiz_app/widgets/widgets.dart';

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  final _formKey = GlobalKey<FormState>();
  String quizImageUrl, quizTitle, quizDescription;
  DatabaseService databaseService = new DatabaseService();

  createQuizOnline(){
    if(_formKey.currentState.validate()){

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
        brightness: Brightness.light,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: [
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter Image Url" : null,
                decoration: InputDecoration(
                  hintText: "Quiz Image Url"
                ),
                onChanged: (val){
                  quizImageUrl = val;
                },
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter Quiz Title" : null,
                decoration: InputDecoration(
                    hintText: "Quiz Title"
                ),
                onChanged: (val){
                  quizImageUrl = val;
                },
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? "Enter Quiz Description" : null,
                decoration: InputDecoration(
                    hintText: "Quiz Description"
                ),
                onChanged: (val){
                  quizImageUrl = val;
                },
              ),
              Spacer(),
              blueButton(
                  context,
                  "Create Quiz"
              ),
              SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
