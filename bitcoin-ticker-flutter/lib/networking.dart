import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final Uri url;
  final Map<String, String> headers;

  NetworkHelper({this.url, this.headers});

  Future getData() async {
    http.Response response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print('STATUS CODE ERROR');
      print(response.statusCode);
    }
  }
}
