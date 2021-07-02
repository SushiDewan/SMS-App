import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class APIwithoutAuthentication {
  String api_url = dotenv.env['API_URL'];
  Future<void> post(endpoint, body, onSuccess, onError) async {
    var client = http.Client();
    try {
      var url = Uri.parse(this.api_url + endpoint);
      var response = await client.post(
        url,
        body: body,
      );
      onSuccess(response);
    } catch (e) {
      onError(e);
    }
  }
}
