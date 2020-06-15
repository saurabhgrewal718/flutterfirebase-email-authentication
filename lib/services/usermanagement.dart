import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';



class UserManagement{
  storeNewUser(user,context){
    Firestore.instance.collection('/users').add({
      'email':user.email,
      'uid':user.uid
    }).then((value){
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homepage');
    }).catchError((e){
      print(e);
    });
  }
}

//this file is not working will mmake a new project to find out why