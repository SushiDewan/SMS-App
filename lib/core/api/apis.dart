import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:smsapp/BLoc/UserInformation.dart';

class APINoToken {
  String apiurl = dotenv.env['API_URL'];

  var dio = Dio();
  Future<void> post(endpoint, body, onSuccess, onError) async {
    var client = http.Client();
    try {
      var url = Uri.parse(this.apiurl + endpoint);
      var response = await client.post(
        url,
        body: jsonEncode(body),
        headers: {"Content-Type": "application/json"},
      );

      onSuccess(response);
    } catch (e) {
      onError(e);
    }
  }
}

class APIToken {
  String apiurl = dotenv.env['API_URL'];
  var dio = Dio();
  Future<void> refreshToken(context) async {
    try {
      var url = Uri.parse(this.apiurl + "school/user/token/refresh/");
      var response = await http.post(
        url,
        body: jsonEncode({"refresh": BlocProvider.of<SchoolBloc>(context).state.refresh}),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        BlocProvider.of<SchoolBloc>(context).setUserInfo(
          result['access'].toString(),
          BlocProvider.of<SchoolBloc>(context).state.refresh,
        );
      }
    } catch (e) {}
  }

  Future<void> post(context, endpoint, body, onSuccess, onError) async {
    try {
      var url = Uri.parse(this.apiurl + endpoint);
      var response = await http.post(
        url,
        body: jsonEncode(body),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "basic ${BlocProvider.of<SchoolBloc>(context).state.access}",
        },
      );
      if (response.statusCode == 401) {
        this.refreshToken(context).then((value) => this.post(context, endpoint, body, onSuccess, onError));
      } else {
        onSuccess(response);
      }
    } catch (e) {
      onError(e);
    }
  }

  Future<void> get(context, endpoint, onSuccess, onError) async {
    var client = http.Client();
    try {
      var url = Uri.parse(this.apiurl + endpoint);
      var token = BlocProvider.of<SchoolBloc>(context).state.access;
      var response = await client.get(
        url,
        headers: {
          "authorization": "JWT " + token,
        },
      );
      if (response.statusCode == 401) {
        this.refreshToken(context).then((value) => this.get(context, endpoint, onSuccess, onError));
      } else {
        onSuccess(response);
      }
    } catch (e) {
      onError(e);
    }
  }
}
