import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/service/auth_service.dart';
import 'package:flutter_quiz_app/views/home_page.dart';
import 'package:flutter_quiz_app/views/login_page.dart';
import 'package:flutter_quiz_app/widgets/widgets.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final _formKey = GlobalKey<FormState>();
  String name,email,password;
  AuthService authService = new AuthService();
  bool _isLoading = false;

  signUp() async{
    if(_formKey.currentState.validate()){
      setState(() {
        _isLoading = true;
      });
      authService.signUpWithEmailAndPassword(email, password).then(
              (value){
                if(value != null){
                 setState(() {
                   _isLoading = false;
                 });
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home())
                );
                }
              }
      );

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: _isLoading ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ) : Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: <Widget>[
              Spacer(),
              TextFormField(
                validator: (val){
                  return val.isEmpty ? "Enter name" : null;
                },
                decoration: InputDecoration(
                  hintText: "Name",
                ),
                onChanged: (val){
                  name = val;
                },
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                validator: (val){
                  return val.isEmpty ? "Enter email" : null;
                },
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                onChanged: (val){
                  email = val;
                },
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                obscureText: true,
                validator: (val){
                  return val.isEmpty ? "Enter password" : null;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                onChanged: (val){
                  password = val;
                },
              ),
              SizedBox(height: 24,),
              GestureDetector(
                onTap: (){
                  signUp();
                },
                child: blueButton(
                    context,
                    "Sign Up")
              ),
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LogIn()
                          )
                      );

                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}
