import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final Uri url;
  final Map<String, String> headers;

  NetworkHelper({this.url, this.headers});

  Future getData() async {
    http.Response response = await http.get(url, headers: headers);

    String data;
    if (response.statusCode == 200) {
      data = response.body;
    } else {
      print('STATUS CODE ERROR');
      print(response.statusCode);
      data = """
      {
      "time": "2017-08-09T14:31:18.3150000Z",
      "asset_id_base": "BTC",
      "asset_id_quote": "USD",
      "rate": 3260.3514321215056208129867667
      }
      """;
    }
    return jsonDecode(data);
  }
}
