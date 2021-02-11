import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import"package:flash_chat/butoesDeRegisto.dart";
import "chat_screen.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {

  static String loginId = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  bool showSpinning = false;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinning,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: "logo",
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black),
                onChanged: (value) {
                    email = value;
                  //Do something with the user input.
                },
                decoration: kemailInput
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                decoration:kpasswordInput,
              ),
              SizedBox(
                height: 24.0,
              ),
              butoesDeRegisto(
                cor: Colors.lightBlueAccent,
                onPress: () async{
                  setState(() {
                    showSpinning=true;
                  });
                  try{
                    final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                    //print (email);
                    //print (password);
                    if (user != null){
                      Navigator.pushNamed(context, ChatScreen.chatScreenId);
                    }
                    setState(() {
                      showSpinning=false;
                    });
                  }catch(e){
                    print (e);
                  }
                },
                title: "Login",),
            ],
          ),
        ),
      ),
    );
  }
}
