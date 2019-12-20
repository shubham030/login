import 'package:flutter/material.dart';
import 'package:login/bloc/register_bloc.dart';
import 'package:login/ui/screens/dash_screen.dart';
import 'package:login/ui/widgets/custom_text_field.dart';
import 'package:login/ui/widgets/login_button_animated.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc _registerBloc = RegisterBloc();
  @override
  void dispose() {
    _registerBloc.dispose();
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
                    height: MediaQuery.of(context).size.height * 0.72,
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
                        Text("Sign up to continue",
                            style: TextStyle(color: Colors.grey, fontSize: 25)),
                        SizedBox(height: 40),
                        StreamBuilder<String>(
                            stream: _registerBloc.name,
                            builder: (context, snapshot) {
                              return CustomTextField(
                                label: "Name",
                                onChanged: _registerBloc.nameChanged,
                                error: snapshot.error,
                              );
                            }),
                        SizedBox(height: 10),
                        StreamBuilder<String>(
                            stream: _registerBloc.email,
                            builder: (context, snapshot) {
                              return CustomTextField(
                                label: "Email",
                                onChanged: _registerBloc.emailChanged,
                                error: snapshot.error,
                              );
                            }),
                        SizedBox(height: 10),
                        StreamBuilder<String>(
                            stream: _registerBloc.password,
                            builder: (context, snapshot) {
                              return CustomTextField(
                                label: "Password",
                                isPassword: true,
                                error: snapshot.error,
                                onChanged: _registerBloc.passwordChanged,
                                icon: Icon(
                                  Icons.https,
                                  size: 27,
                                  color: Color(0xFFF032f41),
                                ),
                              );
                            }),
                        SizedBox(height: 40),
                        StreamBuilder<bool>(
                          stream: _registerBloc.buttonEnabled,
                          builder: (context, snapshot) {
                            return ButtonLoginAnimation(
                              label: "Sign up",
                              fontColor: Colors.white,
                              borderColor: Colors.pink,
                              background: Colors.pinkAccent,
                              isEnabled: snapshot.data ?? false,
                              onTap: () => _registerBloc.signUp(),
//                          background: Color(0xFFF1f94aa),
//                          borderColor: Color(0xFFF1a7a8c),
                              child: DashScreen(),
                            );
                          },
                        ),
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
