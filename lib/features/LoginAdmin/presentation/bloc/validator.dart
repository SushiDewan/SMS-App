import 'dart:async';

mixin Validators {

// name validator
var nameValidator = StreamTransformer<String, String>.fromHandlers(handleData: (name, sink){
  if(name.isEmpty){
    return sink.addError("* required");
  }
});

  //username validator
  var usernameValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username.isEmpty || !RegExp(r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$').hasMatch(username)) {
      return sink.addError("Username shouldnot be empty");
    }
    if (username.length > 32) {
      return sink.addError("Username shouldnot be more than 32");
    } else {
      sink.add(username);
    }
  });

  //password validator

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.isEmpty || !RegExp(r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$').hasMatch(password)) {
      return sink.addError("Invalid Password");
    }if(password.length<6){
      return sink.addError("Password should be atleast 6 characters");
    } 
    else {
      sink.add(password);
    }
  });

  //email validator

  var emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
   
    if (email.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email)) {
      return sink.addError('Enter a valid email');
    } else {
      sink.add(email);
    }
  });

  //contact number validator
  var contactValidator = StreamTransformer<String, String>.fromHandlers(handleData: (contact, sink){
    if(contact.isEmpty|| !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(contact)){
      return sink.addError("Please enter valid contact number");
    }
    if(contact.length<10){
      return sink.addError("Contact Number must be of 10 digit");
    }else{
      sink.add(contact);
    }
  });

  //Edn number
  var ednValidator = StreamTransformer<String, String>.fromHandlers(handleData: (edn, sink){
    if(edn.isEmpty){
      return sink.addError("* required");
    }
  });

  //address validator
  var addressValidator = StreamTransformer<String, String>.fromHandlers(handleData: (address, sink){
    if(address.isEmpty){
      return sink.addError("* required");
    }
  });
}
