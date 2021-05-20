import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/service/auth_service.dart';
import 'package:flutter_quiz_app/views/home_page.dart';
import 'package:flutter_quiz_app/views/signup_page.dart';
import 'package:flutter_quiz_app/widgets/widgets.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();

}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  String email,password;
  AuthService authService =  new AuthService();
  bool _isLoading = false;

  signIn() async{
    if(_formKey.currentState.validate()){
      setState(() {
        _isLoading = true;
      });
      await authService.signInEmailAndPass(email, password).then((val){
        if(val != null){
          setState(() {
            _isLoading = false;
          });
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Home()
          ));
        }
      });



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
                  signIn();
                },
                child: blueButton(
                    context,
                    "Sign In"
                )
              ),
              SizedBox(height: 18,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have an account? ",
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
                              builder: (context) => Signup()
                          )
                      );

                    },
                    child: Text(
                        "Sign Up",
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
      )
    );

  }
}
