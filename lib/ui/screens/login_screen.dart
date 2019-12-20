import 'package:flutter/material.dart';
import 'package:login/bloc/login_bloc.dart';
import 'package:login/ui/screens/dash_screen.dart';
import 'package:login/ui/widgets/custom_text_field.dart';
import 'package:login/ui/widgets/login_button_animated.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc = LoginBloc();

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/fruit.jpg",
                ),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back,
                                color: Colors.white, size: 32),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                    height: MediaQuery.of(context).size.height * 0.70,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Welcome",
                            style: TextStyle(
                                color: Color(0xFFF032f42),
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                        Text("Sign in to continue",
                            style: TextStyle(color: Colors.grey, fontSize: 25)),
                        SizedBox(height: 40),
                        StreamBuilder<String>(
                            stream: _loginBloc.email,
                            builder: (context, snapshot) {
                              return CustomTextField(
                                label: "Email",
                                onChanged: _loginBloc.emailChanged,
                                error: snapshot.error,
                              );
                            }),
                        SizedBox(height: 10),
                        StreamBuilder<String>(
                            stream: _loginBloc.password,
                            builder: (context, snapshot) {
                              return CustomTextField(
                                label: "Password",
                                isPassword: true,
                                error: snapshot.error,
                                onChanged: _loginBloc.passwordChanged,
                                icon: Icon(
                                  Icons.https,
                                  size: 27,
                                  color: Color(0xFFF032f41),
                                ),
                              );
                            }),
                        SizedBox(height: 40),
                        StreamBuilder<bool>(
                            stream: _loginBloc.buttonEnabled,
                            builder: (context, snapshot) {
                              return ButtonLoginAnimation(
                                label: "Login",
                                fontColor: Colors.white,
                                borderColor: Colors.pink,
                                background: Colors.pinkAccent,
                                isEnabled: snapshot.data ?? false,
                                onTap: () => _loginBloc.logIn(),
//                          background: Color(0xFFF1f94aa),
//                          borderColor: Color(0xFFF1a7a8c),
                                child: DashScreen(),
                              );
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
