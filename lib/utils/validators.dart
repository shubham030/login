import 'dart:async';

class Validator {
  var emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      //Regexp for validating email
      RegExp re = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (re.hasMatch(email)) {
        sink.add(email);
      } else {
        sink.addError('Please enter a valid email');
      }
    },
  );

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink) {
//    RegExp passwordChecker =
//        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

      if (password.length >= 8) {
        sink.add(password);
      } else {
        sink.addError('Password must be atleast 8 chatacter long');
      }
    },
  );

  var nameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (name, sink) {
      if (name.length > 2) {
        sink.add(name);
      } else {
        sink.addError('Name should atleast contain 2 characters');
      }
    },
  );
}
