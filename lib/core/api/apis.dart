import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class APINoToken {
  String apiurl = dotenv.env['API_URL'];
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
