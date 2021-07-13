import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smsapp/core/api/apis.dart';

class Grade {
  int schoolid;
  List<Map> grades = [];
  var _api = APIToken();
  void createGrade({
    @required int schoolid,
    @required String grade,
    @required Function onSuccess,
    Function onFailure,
    Function onError,
  }) {
    this._api.post(
      "/school/grade/",
      {
        "school_id": "1",
        "name": "Grade 1",
      },
      (response) {
        Map result = jsonDecode(response);
        if (response.statusCode == 201) {
          onSuccess(result);
        } else {
          onFailure(result);
        }
      },
      (error) {
        onError(error);
      },
    );
  }

  void getGradeList({
    @required int schoolid,
    @required String grade,
    @required Function onSuccess,
    Function onFailure,
    Function onError,
  }) {
    this._api.get(
      "/school/exam/",
      (response) {
        Map result = jsonDecode(response);
        if (response.statusCode == 200) {
          onSuccess(result);
        } else {
          onFailure(result);
        }
      },
      (error) {
        onError(error);
      },
    );
  }
}
