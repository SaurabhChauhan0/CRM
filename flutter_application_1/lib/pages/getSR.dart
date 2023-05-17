import 'package:http/http.dart' as http;
import 'dart:convert';
import '/config.dart';

var data = [];

class GetSR {
  Future getStatus() async {
    http.Response response = await http.get(Uri.parse(statusPending));

    if (response.statusCode == 200) {
      var data1 = json.decode(response.body);
      data = data1;
    }
  }
}
