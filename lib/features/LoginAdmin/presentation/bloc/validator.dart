
import 'dart:async';

mixin Validators{

  //username validator
  var usernameValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (username,sink){
      if(username.isEmpty){
        return sink.addError("Username shouldnot be empty");
      }
      if(username.length>32){
        return sink.addError("Username shouldnot be more than 32");
      }else{
        sink.add(username);
      }
    }
  );

  //password validator

  var passwordValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){
      if(password.isEmpty){
        return sink.addError("Enter valid password");
      }else{
        sink.add(password);
      }
    }
  );

  //email validator

  var emailValidator = StreamTransformer<String,String>.fromHandlers(
    handleData: (email,sink){
      if(!email.contains("@")){
        return sink.addError("Enter valid email address");
      }else{
        sink.add(email);
      }
    }
  );
}