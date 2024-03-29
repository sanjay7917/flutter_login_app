import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators{
  final _email= BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (e, p) => true);  

  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmailz = _email.value;
    final validPasswordz = _password.value;

    print('Email is $validEmailz');
    print('Password id $validPasswordz');
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
