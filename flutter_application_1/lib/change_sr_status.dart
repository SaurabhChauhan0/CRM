import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/config.dart';
import 'pages/getSR.dart';
import 'pages/SRDetail_page.dart';
import 'package:get/get.dart';
import './pages/overview_page.dart';

void changeStatus(
    var serviceRequestId, var selectedUserId, var status, var context) async {
  var reqBody = {
    "bookingId": serviceRequestId,
    "allotted": selectedUserId,
    "status": status
  };
  http.Response response = await http.put(Uri.parse(updateSR),
      headers: {"Content-type": "application/json"}, body: jsonEncode(reqBody));
  if (response.statusCode == 200) {
    if (status != "rejected") {
      status = "forwareded";
    }
    Get.snackbar(
      'Success',
      'Service Request $status successfully!',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      animationDuration: const Duration(milliseconds: 300),
      isDismissible: true,
      // dismissDirection: SnackDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.easeOut,
      reverseAnimationCurve: Curves.easeIn,
      icon: const Icon(
        Icons.check_circle_outline,
        color: Colors.white,
      ),
      shouldIconPulse: true,
      mainButton: TextButton(
        onPressed: () {
          Get.back();
          // Dismiss the snackbar
        },
        child: const Text(
          'OK',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    // Future.delayed(Duration(seconds: 1), () {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OverviewPage()));

    // });
  } else {
    Get.snackbar(
      "Error",
      "Service Request can't be Assigned !",

      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Color.fromARGB(255, 219, 47, 47),
      colorText: Colors.white,
      duration: const Duration(seconds: 2),
      borderRadius: 10.0,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      animationDuration: const Duration(milliseconds: 300),
      isDismissible: true,
      // dismissDirection: SnackDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.easeOut,
      reverseAnimationCurve: Curves.easeIn,
    );
  }
}
