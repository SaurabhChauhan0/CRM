import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/scheduler.dart';
import 'pages/login_page.dart';
// import 'pages/signup_page.dart';
import 'pages/overview_page.dart';
import 'pages/editSR_page.dart';
import 'pages/createSR_page.dart';
// import 'pages/SRdetail_page.dart';
import 'pages/signup_page.dart';
import 'pages/client_list_page.dart';
// import 'pages/total_service_request_page.dart';
// import 'pages/rejected_service_request_page.dart';
// import 'pages/complete_service_request_page.dart';
// import 'pages/pending_approval_page.dart';
import 'pages/payment_details_page.dart';
// import 'pages/project_approval_page.dart';
import 'pages/client_list2_page.dart';
// import 'pages/SR_details_page.dart';
// import 'package:mongo_dart/mongo_dart.dart';
// import 'package:flutter_application_1/dbHelper/mongodb.dart';
// import 'dart:ui'
import 'pages/lower_employee_page.dart';
import "pages/profile_page.dart";
import "currently_logged_in_user.dart";
import 'pages/new_service_request_details_page.dart';

void main() async {
  // print("tmep");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primaryColor: Colors.blue, // Set the primary color of the app
        // colorScheme: Color.fromARGB(255, 236, 78, 66), // Set the accent color of the app
        fontFamily: 'Roboto', // Set the default font family
      ),
      home: LoginPage(),
      // home: ServiceRequestDetailsPage(
      //   name: "title",
      //   address: "this is the first service request",
      //   createdDate: "34343",
      //   serviceType: "Manager",
      //   phoneNumber: "phoneNumber",
      //   email: "email",
      //   description: " description",
      //   status: " description",
      //   assignedTo: " description",
      //   priority: " description",
      // )
      // home: EditSRPage(),
      // home: SRDetailscd Page(),
      // home: TotalServiceRequestPage(),
      // home: CompleteServiceRequestPage(),
      // home: PaymentDetailsPage(),
      // home: OverviewPage(),
      // home: SignupPage(),
      // home: TeamLeadersPage(),
    );
  }
}
