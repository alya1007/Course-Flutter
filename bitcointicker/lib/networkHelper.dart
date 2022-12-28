import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String apiKey = '8BFEDB79-1E39-467A-957C-49AAB99EDBBE';
  String url = 'https://rest.coinapi.io/v1/exchangerate/';

  Future<dynamic> getRate(crypto, currency) async {
    http.Response response =
        await http.get(Uri.parse('$url$crypto/$currency?apikey=$apiKey'));
    String data = response.body;
    return jsonDecode(data);
  }
}
