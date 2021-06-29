
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:smsapp/features/LoginAdmin/presentation/bloc/validator.dart';

class AdminLoginBloc with Validators{
  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  

  //getters : so that other class can access it

  Stream<String> get loginUsername => _usernameController.stream.transform(usernameValidator);
  Stream<String> get loginPassword => _passwordController.stream.transform(passwordValidator);
  Stream<bool> get isValid => Rx.combineLatest2(loginUsername, loginPassword, (a, b) => true);

  //Setters : defines who/how/from where change

  Function(String) get changeloginUsername => _usernameController.sink.add;
  Function(String) get changeloginPassword => _passwordController.sink.add;


void submit(){
  print( _usernameController.value);
  print(_passwordController.value);
}

  
  void dispose(){
    _usernameController.close();
    _passwordController.close();
  } 
}  