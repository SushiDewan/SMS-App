import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInformation {
  String schoolCode = "";
  String schoolName = "";
  String access = '';
  String refresh = '';
  String adminId = '';
  String username = '';
  String role = '';

  loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.schoolCode = prefs.getString("code");
    this.schoolName = prefs.getString("schoolname");
    this.access = prefs.getString('accesstoken');
    this.refresh = prefs.getString('refreshtoken');
    this.adminId = prefs.getString('adminid');
    this.username = prefs.getString('username');
    this.role = prefs.getString('role');
  }

  delete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.access = '';
    this.refresh = '';
    this.adminId = '';
    this.username = '';
    this.role = '';
    prefs.clear();
  }

  setCodeAndName(String code, String name) {
    this.schoolCode = code;
    this.schoolName = name;
  }

  setUserInformation(access, refresh, adminId, username, role) {
    this.access = access;
    this.refresh = refresh;
    this.adminId = adminId;
    this.username = username;
    this.role = role;

    Future<void> saveData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("code", this.schoolCode);
      prefs.setString("schoolname", this.schoolName);
      prefs.setString('accesstoken', this.access);
      prefs.setString('refreshtoken', this.refresh);
      prefs.setString('adminid', this.adminId);
      prefs.setString('username', this.username);
      prefs.setString('role', this.role);
    }

    saveData();
  }

  Future<bool> isLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var refresh = prefs.getString('refreshtoken');
    if (refresh == null) {
      return false;
    } else {
      loadData();
      return true;
    }
  }
}

class SchoolBloc extends Cubit<UserInformation> {
  SchoolBloc() : super(UserInformation());
  void setCode(String code, String name) {
    state.setCodeAndName(code, name);
    return emit(state);
  }

  void setUserInfo(access, refresh, adminId, username, role) {
    state.setUserInformation(access, refresh, adminId, username, role);
  }

  void logout() {
    state.delete();
  }

  Future<bool> isLogin() async {
    return await state.isLogin();
  }
}
