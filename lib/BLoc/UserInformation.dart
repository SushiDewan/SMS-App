import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smsapp/Classes/Exam.dart';

class UserInformation {
  String schoolCode = "";
  String schoolName = "";
  String access =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjI2MjA2NzA5LCJqdGkiOiI5N2M5ZGYxNmRhMmQ0ODYzYmEwODJjMjJmMTE4MjY2NCIsInVzZXJfaWQiOjIyfQ.IHfWKsyPZvjwlaWSYI4gqf-Wuc9HoXZ7HBwebamB0U0';
  String refresh = '';
  String adminId = '';
  String username = '';
  String role = '';
  Exam exam = Exam();

  UserInformation() {
    exam.getExamOptions(onSuccess: () {});
  }

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

  setUserInformation(access, refresh) {
    this.access = access;
    this.refresh = refresh;

    Future<void> saveData() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("code", this.schoolCode);
      prefs.setString("schoolname", this.schoolName);
      prefs.setString('accesstoken', this.access);
      prefs.setString('refreshtoken', this.refresh);
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

  void setUserInfo(access, refresh) {
    state.setUserInformation(access, refresh);
  }

  void logout() {
    state.delete();
  }

  Future<bool> isLogin() async {
    return await state.isLogin();
  }
}
