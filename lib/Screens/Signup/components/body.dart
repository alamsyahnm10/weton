import 'package:flutter/material.dart';
import 'package:weton/Screens/Login/login_screen.dart';
import 'package:weton/Screens/Signup/components/background.dart';
import 'package:weton/components/already_have_an_account_acheck.dart';
import 'package:weton/components/rounded_button.dart';
import 'package:weton/components/rounded_input_field.dart';
import 'package:weton/components/rounded_password_field.dart';

class Body extends StatelessWidget {
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
              'images/signup.png',
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Email Anda",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () {},
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
