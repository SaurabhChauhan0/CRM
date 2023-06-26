import 'package:http/http.dart' as http;
import 'dart:convert';
import '/config.dart';

import 'package:get/get.dart';

import 'package:flutter_application_1/currently_logged_in_user.dart';

final UserController userController = Get.find<UserController>();
final userId = userController.user?.id;

var totalSR = [];
var pendingSR = [];
var completedSR = [];
var rejectedSR = [];
var currentlyAllottedSR = [];

class GetSR {
  Future getStatus() async {
    http.Response response = await http.get(Uri.parse(statusPending));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      totalSR = data;

      pendingSR = [];
      completedSR = [];
      rejectedSR = [];
      currentlyAllottedSR = [];

      for (int i = 0; i < data.length; i++) {
        if (data[i]["status"] == "pending") {
          pendingSR.add(data[i]);
        } else if (data[i]["status"] == "completed") {
          completedSR.add(data[i]);
        } else if (data[i]["status"] == "rejected") {
          rejectedSR.add(data[i]);
        }
        if (data[i]["allotted"] == userId) {
          currentlyAllottedSR.add(data[i]);
        }
      }
    }
  }
}







// class MyObject {
//   final String id;
//   final String type;

//   MyObject({required this.id, required this.type});

//   factory MyObject.fromJson(Map<String, dynamic> json) {
//     return MyObject(
//       id: json['id'],
//       type: json['type'],
//     );
//   }
// }

// Future<void> fetchData() async {
//   final response =
//       await http.get(Uri.parse('https://your-api-url.com/endpoint'));
//   if (response.statusCode == 200) {
//     final List<dynamic> jsonData = jsonDecode(response.body);

//     // Separate objects into different arrays based on the type
//     List<MyObject> type1Objects = jsonData
//         .where((obj) => obj['type'] == 'type1')
//         .map((obj) => MyObject.fromJson(obj))
//         .toList();
//     List<MyObject> type2Objects = jsonData
//         .where((obj) => obj['type'] == 'type2')
//         .map((obj) => MyObject.fromJson(obj))
//         .toList();
//     List<MyObject> type3Objects = jsonData
//         .where((obj) => obj['type'] == 'type3')
//         .map((obj) => MyObject.fromJson(obj))
//         .toList();
//     List<MyObject> type4Objects = jsonData
//         .where((obj) => obj['type'] == 'type4')
//         .map((obj) => MyObject.fromJson(obj))
//         .toList();

//     // Print the separated arrays
//   }
// }
