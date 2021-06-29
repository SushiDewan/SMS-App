import 'package:rxdart/rxdart.dart';
import 'package:smsapp/features/LoginAdmin/presentation/bloc/validator.dart';

class AdminRegisterBloc with Validators {
  final _firstname = BehaviorSubject<String>();
  final _lastname = BehaviorSubject<String>();
  final _email = BehaviorSubject<String>();
  final _contactnum = BehaviorSubject<String>();
  final _address = BehaviorSubject<String>();
  final _role = BehaviorSubject<String>();
  final _edn = BehaviorSubject<String>();
  final _username = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //getter

  Stream<String> get firstname => _firstname.stream;
  Stream<String> get lastname => _lastname.stream;
  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get contactnum => _contactnum.stream;
  Stream<String> get address => _address.stream;
  Stream<String> get role => _role.stream;
  Stream<String> get edn => _edn.stream;
  Stream<String> get username => _username.stream.transform(usernameValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);


  Stream<bool> get isValid => Rx.combineLatest3(
      
      email,     
      username,
      password,
      (a, b, c) => true);

  //setter

  Function(String) get changefirstname => _firstname.sink.add;
  Function(String) get changelastname => _lastname.sink.add;
  Function(String) get changeemail => _email.sink.add;
  Function(String) get changecontactnum => _contactnum.sink.add;
  Function(String) get changeaddress => _address.sink.add;
  Function(String) get changerole => _role.sink.add;
  Function(String) get changeedn => _edn.sink.add;
  Function(String) get changeusername => _username.sink.add;
  Function(String) get changepassword => _password.sink.add;



  void dispose() {
    _firstname.close();
    _lastname.close();
    _email.close();
    _contactnum.close();
    _address.close();
    _role.close();
    _edn.close();
    _username.close();
    _password.close();
  }

  
}
