import 'package:http/http.dart' as http;
import 'package:smsapp/features/SchoolCode/data/models/school_id_models.dart';
import 'strings.dart';
import 'dart:convert';

class ApiConstants {
  Future<SchoolIdModel> getData(id) async {
    var client = http.Client();
    var welcome = null;
    try {
      var url = Uri.parse(Strings.School_ID_API_KEY);
      print(id);
      var response = await client.post(url, body: {'id': id});
      print(response.body);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        welcome = SchoolIdModel.fromJson(jsonMap);
      }
    } catch (e) {
      return welcome;
    }
    return welcome;
  }
}
