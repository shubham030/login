import 'dart:async';

import 'package:login/utils/validators.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc with Validator {
  //TO change between login and register page

  //register field values
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();

  //function for Adding values to stream from textFields
  Function(String) get emailChanged => _email.sink.add;
  Function(String) get passwordChanged => _password.sink.add;
  Function(String) get nameChanged => _name.sink.add;

  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);
  Stream<String> get name => _name.stream.transform(nameValidator);

  Stream<bool> get buttonEnabled =>
      CombineLatestStream.combine3(email, password, name, (e, p, n) => true);

  //Called on clicking sign up button
  void signUp() {
    //hash the password
    //sign up api
    //printing values for reference
    print(
      'name -> ${_name.value} : email -> ${_email.value} : password -> ${_password.value}',
    );
  }

  void dispose() {
    _email.close();
    _password.close();
    _name.close();
  }
}
