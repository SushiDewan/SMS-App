import 'package:shared_preferences/shared_preferences.dart';

class Admin {
  String accesstoken, refreshtoken, admin_id, username, role;
  void setToken(accesstoken, refreshtoken, id, username, role) {
    this.accesstoken = accesstoken;
    this.refreshtoken = refreshtoken;
    this.admin_id = id.toString();
    this.username = username;
    this.role = role;
  }

  Future<void> savetoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(this.accesstoken);
    print(this.refreshtoken);
    prefs.setString('accesstoken', this.accesstoken);
    prefs.setString('refreshtoken', this.refreshtoken);
    prefs.setString('admin_id', this.admin_id);
    prefs.setString('username', this.username);
    prefs.setString('role', this.role);
  }
}
