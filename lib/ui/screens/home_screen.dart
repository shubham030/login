import 'package:flutter/material.dart';
import 'package:login/ui/animations/fade.dart';
import 'package:login/ui/screens/register_screen.dart';
import 'package:login/ui/widgets/custom_button.dart';
import 'package:login/ui/widgets/custom_button_animated.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/images/login1.jpg", fit: BoxFit.cover),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFF001117).withOpacity(0.7),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(top: 80, bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        2.4,
                        Text("Welcome to",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                letterSpacing: 2))),
                    FadeAnimation(
                        2.6,
                        Text("Sweet shop",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
//                    FadeAnimation(
//                      3.2,
//                      CustomButtonAnimation(
//                        label: "Sign Up",
//                        background: Colors.transparent,
//                        borderColor: Colors.white,
//                        fontColor: Colors.white,
//                        child: RegisterScreen(),
//                      ),
//                    ),
                    FadeAnimation(
                      2.8,
                      CustomButton(
                        label: "Sign up",
                        background: Colors.transparent,
                        fontColor: Colors.white,
                        borderColor: Colors.white,
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    FadeAnimation(
                      3.2,
                      CustomButtonAnimation(
                        label: "Sign In",
                        background: Colors.white,
                        borderColor: Colors.white,
                        fontColor: Color(0xFFF001117),
                        child: LoginScreen(),
                      ),
                    ),
                    SizedBox(height: 30),
                    FadeAnimation(
                      3.4,
                      Text(
                        "Forgot password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
