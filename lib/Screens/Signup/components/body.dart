// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weton/Screens/Login/login_screen.dart';
import 'package:weton/Screens/Signup/components/background.dart';
import 'package:weton/components/already_have_an_account_acheck.dart';
import 'package:weton/components/rounded_button.dart';
import 'package:weton/components/rounded_input_field.dart';
import 'package:weton/components/rounded_password_field.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';



class Body extends StatelessWidget {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future register()async{
    var url = "http://192.168.43.251/weton/register.php";
    var response = await http.post(Uri.parse(url), body: {
      "username" : user.text,
      "password" : pass.text,
    });

    var data = json.decode(response.body);
    if (data == "Error"){
     Fluttertoast.showToast(
        msg: "This User Already Exit!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    ); 
    } else {
      Fluttertoast.showToast(
        msg: "Registration Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    ); 
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/signup.png",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Username",
              onChanged: (user) {},
            ),
            RoundedPasswordField(
              onChanged: (pass) {},
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () {
                register();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
