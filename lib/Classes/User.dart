import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smsapp/core/api/apis.dart';

class User {
  String name, role, id;
  String _firstname, _lastname, _email, _role, _contactnumber, _address, _ednnumber, _username, _password, _schoolId;
  String _accesstoken, _refreshtoken;
  APINoToken api = new APINoToken();
  void register({
    String firstname,
    String lastname,
    String email,
    String role,
    String contactnumber,
    String address,
    String ednnumber,
    String username,
    String password,
    String schoolId,
    Function onSuccess,
    Function onFailure,
    Function onError,
  }) {
    // onSuccess is a callback function if registration is completed with no errors -> returns String of message
    // onFailure is a callback function if registration is not completed -> returns Map of error handles
    // onError is a callback function if any error occurs on registation  -> returns error
    this._firstname = firstname;
    this._lastname = lastname;
    this._email = email;
    this._contactnumber = contactnumber;
    this._address = address;
    this._role = role;
    this._ednnumber = ednnumber;
    this._username = username;
    this._password = password;
    this._schoolId = schoolId;
    //API called
    this.api.post('school/user/register/admin/', {
      "user": {
        "first_name": this._firstname,
        "last_name": this._lastname,
        "email": this._email,
        "contact_number": this._contactnumber,
        "address": this._address,
        "role": this._role,
        "edn_number": this._ednnumber,
        "username": this._username,
        "password": this._password,
      },
      "school_id": this._schoolId,
    }, (Response response) {
      Map result = jsonDecode(response.body);
      if (response.statusCode == 201) {
        onSuccess(result['message']);
      } else {
        Map errors = {
          'message': 'User not registered',
          'email': result['user'].containsKey('email') ? result['user']['email'][0] : null,
          'username': result['user'].containsKey('username') ? result['user']['username'][0] : null,
          'contactnumber': result['user'].containsKey('contact_number') ? result['user']['contact_number'][0] : null,
          'ednnumber': result['user'].containsKey('edn_number') ? result['user']['edn_number'][0] : null,
        };
        onFailure(errors);
      }
    }, (error) {
      onError(error);
    });
  }

  Future<void> _saveTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("@accessToken", this._accesstoken);
    prefs.setString("@refreshToken", this._refreshtoken);
  }

  Future<void> _getTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this._accesstoken = prefs.getString("@accessToken");
    this._refreshtoken = prefs.getString("@refreshToken");
  }

  void login({
    String username,
    String password,
    Function onSuccess,
    Function onFailure,
    Function onError,
  }) {
    // onSuccess is a callback function if registration is completed with no errors -> returns String of message
    // onFailure is a callback function if registration is not completed -> returns Map of error handles
    // onError is a callback function if any error occurs on registation  -> returns error
    this._username = username;
    this._password = password;
    //API called
    this.api.post('school/user/register/admin/', {
      "username": this._username,
      "password": this._password,
    }, (Response response) {
      Map result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        this._accesstoken = result['access'];
        this._refreshtoken = result['refresh'];

        this._saveTokens();
        onSuccess(result['message']);
      } else {
        Map errors = {
          'message': result['non_field_errors'][0],
        };
        onFailure(errors);
      }
    }, (error) {
      onError(error);
    });
  }
}
