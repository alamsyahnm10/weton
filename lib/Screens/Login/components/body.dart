import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weton/Screens/Login/components/background.dart';
import 'package:weton/Screens/Signup/signup_screen.dart';
import 'package:weton/components/already_have_an_account_acheck.dart';
import 'package:weton/components/rounded_button.dart';
import 'package:weton/components/rounded_input_field.dart';
import 'package:weton/components/rounded_password_field.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Body extends StatelessWidget {
  //const Body({
    //Key key,
  //}) : super(key: key);

  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login()async{
    var url = "http://192.168.43.251/weton/login.php";
    var response = await http.post(Uri.parse(url), body: {
      "username" : user.text,
      "password" : pass.text,
    });
    var data = json.decode(response.body);
    if (data == "Success") {
      Fluttertoast.showToast(
        msg: "Login Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
    //Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome())) 
    } else {
      Fluttertoast.showToast(
        msg: "Username & Password Incorrect!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
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
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/login.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Username",
              onChanged: (user) {},
            ),
            RoundedPasswordField(
              onChanged: (pass) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                login();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
