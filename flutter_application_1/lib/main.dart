import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
import 'pages/login_page.dart';
// import 'pages/signup_page.dart';
// import 'pages/overview_page.dart';
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
// import 'dart:ui';

void main() async {
  // print("tmep");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(),
      home: LoginPage(),
      // home: EditSRPage(),
      // home: SRDetailsPage(),
      // home: ClientList2Page("saurabh", "mechanic", "mawana", 5, 1),
      // home: TotalServiceRequestPage(),
      // home: CompleteServiceRequestPage(),
      // home: PaymentDetailsPage(),
      // home: OverviewPage(),
      // home: SignupPage(),
    );
  }
}
