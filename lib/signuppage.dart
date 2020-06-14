import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_firebase/services/usermanagement.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

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
              ),
              SizedBox(height:20),
              RaisedButton(
                child: Text('Signup'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7,
                onPressed: (){
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: _email, 
                    password: _password
                  ).then((signedInUser){
                    UserManagement().storeNewUser(signedInUser,context);
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  })
                  .catchError((e){
                    print(e);
                  });
                },
              ),              
              SizedBox(height:20),
              Text('Have an account ? '),
              RaisedButton(
                child: Text('Login'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7,
                onPressed: (){
                  Navigator.of(context).pushNamed('/landingpage');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}