import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:smsapp/core/api/apis.dart';

class Exam {
  BuildContext context;
  List examoptions = [];
  List examType = [];
  setContext(context) {
    this.context = context;
  }

  var _api = APIToken();

  void createExam({
    @required DateTime startDate,
    @required DateTime endDate,
    @required String examType,
    @required String gradeId,
    @required Function onSuccess,
    @required Function onFailure,
    @required Function onError,
  }) {
    this._api.post(this.context, "school/exam/", {
      "start_date": "${startDate.year}-${startDate.month}-${startDate.day}",
      "end_date": "${endDate.year}-${endDate.month}-${endDate.day}",
      "exam_type": examType,
      "grade_id": gradeId,
    }, (Response response) {
      var result = jsonDecode(response.body);

      print("Result");
      print(result);
      if (response.statusCode == 201)
        onSuccess(result);
      else
        onFailure(result);
    }, (error) {
      onError(error);
    });
  }

  void getExamOptions({
    @required Function onSuccess,
  }) {
    this._api.get(this.context, "school/exam/", (Response response) {
      var result = jsonDecode(response.body);
      print(result['grades']);
      try {
        this.examoptions = [
          {"id": result['grades'].keys.first, "grade": result['grades'].values.first}
        ];
      } catch (error) {
        print(error);
      }
      print(this.examoptions);
      onSuccess();
    }, (error) {});
  }

  void getExamType({
    @required String gradeId,
    @required Function onSuccess,
    @required Function onFailure,
    @required Function onError,
  }) {
    this._api.post(this.context, "school/exam/view/", {
      "grade_id": gradeId,
    }, (Response response) {
      var result = jsonDecode(response.body);
      print(result);
      if (response.statusCode == 200)
        onSuccess(result);
      else
        onFailure(result);
    }, (error) {
      onError(error);
    });
  }

  void updateExam() {}
}
