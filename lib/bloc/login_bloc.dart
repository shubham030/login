import 'dart:async';

import 'package:login/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validator {
  //TO change between login and register page
  final _isLogin = BehaviorSubject<bool>();
  final _opacity = BehaviorSubject<bool>();

  //Login field values
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //function for Adding values to stream from textFields
  Function(String) get emailChanged => _email.sink.add;
  Function(String) get passwordChanged => _password.sink.add;

  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);

  Stream<bool> get buttonEnabled =>
      CombineLatestStream.combine2(email, password, (e, p) => true);

  //Called on clicking login button
  void logIn() {
    //hash the password
    //login api
    //printing values for reference
    print('email -> ${_email.value} : password -> ${_password.value}');
  }

  void dispose() {
    _isLogin.close();
    _opacity.close();
    _email.close();
    _password.close();
  }
}
