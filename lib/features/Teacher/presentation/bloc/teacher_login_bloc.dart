
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:smsapp/features/LoginAdmin/presentation/bloc/validator.dart';

class TeacherLoginBloc with Validators{
  final _usernameController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  

  //getters : so that other class can access it

  Stream<String> get teacherUsername => _usernameController.stream.transform(usernameValidator);
  Stream<String> get teacherPassword => _passwordController.stream.transform(passwordValidator);
  Stream<bool> get isValid => Rx.combineLatest2(teacherUsername, teacherPassword, (a, b) => true);

  //Setters : defines who/how/from where change

  Function(String) get changeteacherUsername => _usernameController.sink.add;
  Function(String) get changeteacherPassword => _passwordController.sink.add;


void submit(){
  print( _usernameController.value);
  print(_passwordController.value);
  
}

  
  void dispose(){
    _usernameController.close();
    _passwordController.close();
  } 
}  