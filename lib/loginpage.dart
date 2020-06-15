import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    _email=value;
                  });
                },
              ),
              SizedBox(height:15),
              TextField(
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (value) {
                  setState(() {
                    _password=value;
                  });
                },
                obscureText: true,
              ),
              SizedBox(height:20),
              RaisedButton(
                child: Text('Login'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7,
                onPressed:(){
                  FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                      email: _email,password: _password)
                    .then((user){
                      Navigator.of(context).pushReplacementNamed('/homepage');
                    })
                    .catchError((e){
                      print(e); 
                    });
                },
              ),              
              SizedBox(height:20),
              Text('Dont have an account ? '),
              RaisedButton(
                child: Text('Signup'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7,
                onPressed: (){
                  Navigator.of(context).pushNamed('/signup');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//everything works on this page