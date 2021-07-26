import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:smsapp/core/api/apis.dart';

class Class {
  String id, name;
  void jsonToClass(Map map) {
    this.id = map['id'];
    this.name = map['name'];
  }
}

class ClassList {
  List<Class> classList = [];
  BuildContext _context;

  var _api = APIToken();

  void setContext(BuildContext context) {
    this._context = context;
  }

  void getExamOptions() {
    print("API fetching");
    this._api.get(this._context, "school/exam/", (Response response) {
      var result = jsonDecode(response.body);
      print(result);
      Class class1 = new Class();
      print(result);
      class1.jsonToClass({"id": result['grades'].keys.first, "name": result['grades'].values.first});
      classList.add(class1);
    }, (error) {
      print(error);
    });
  }
}

class ExamDetail {
  String exam_type;
  DateTime start_date_time, end_date_time;
}
