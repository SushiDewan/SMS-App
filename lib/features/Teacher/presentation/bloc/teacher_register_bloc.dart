import 'package:rxdart/rxdart.dart';
import 'package:smsapp/features/LoginAdmin/presentation/bloc/validator.dart';

class TeacherRegisterBloc with Validators {
  final _firstname = BehaviorSubject<String>();
  final _lastname = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _contactnum = BehaviorSubject<String>();
  final _address = BehaviorSubject<String>();
  final _edn = BehaviorSubject<String>();
  final _username = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _staffType = BehaviorSubject<String>();

  //getter

  Stream<String> get teacherFirstname => _firstname.stream.transform(nameValidator);
  Stream<String> get teacherLastname => _lastname.stream.transform(nameValidator);
  Stream<String> get teacherEmail => _email.stream.transform(emailValidator);
  Stream<String> get teacherContact => _contactnum.stream.transform(contactValidator);
  Stream<String> get teacherAddress => _address.stream.transform(addressValidator);
  Stream<String> get teacherEdn => _edn.stream.transform(ednValidator);
  Stream<String> get teacherUsername => _username.stream.transform(usernameValidator);
  Stream<String> get teacherPassword => _password.stream.transform(passwordValidator);
  Stream<String> get teacherStaffType => _staffType.stream.transform(passwordValidator);


  Stream<bool> get isValid => Rx.combineLatest3(
      
      teacherEmail,     
      teacherUsername,
      teacherPassword,
      (a, b, c) => true);

  //setter

  Function(String) get changeteacherfirst => _firstname.sink.add;
  Function(String) get changeteacherlast => _lastname.sink.add;
  Function(String) get changeteacheremail => _email.sink.add;
  Function(String) get changeteachercontact => _contactnum.sink.add;
  Function(String) get changeteacheraddress => _address.sink.add;
  Function(String) get changeteacheredn => _edn.sink.add;
  Function(String) get changeteacherusername => _username.sink.add;
  Function(String) get changeteacherpassword => _password.sink.add;



  void dispose() {
    _firstname.close();
    _lastname.close();
    _email.close();
    _contactnum.close();
    _address.close();
    _edn.close();
    _username.close();
    _password.close();
    _staffType.close();
  }

  
}
