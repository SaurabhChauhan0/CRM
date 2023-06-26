import 'package:flutter/material.dart';
import 'package:flutter_application_1/change_sr_status.dart';
import 'package:flutter_application_1/pages/client_list_page.dart';
import './lower_employee_page.dart';
import './getSR.dart';
import './overview_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import '/config.dart';
import '/change_sr_status.dart';

class SRDetailPage extends StatefulWidget {
  final String from;
  final String dateAndTime;
  final String orderId;
  final String destination;
  final int value;
  final String description;

  SRDetailPage({
    required this.from,
    required this.dateAndTime,
    required this.orderId,
    required this.destination,
    required this.value,
    required this.description,
  });

  @override
  State<SRDetailPage> createState() => _SRDetailPageState();
}

class _SRDetailPageState extends State<SRDetailPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        title: Text(
          "SR Detail Page",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Colors.grey,
            )),
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 20),
            Row(
              children: [
                makeContainer(
                    label: "From",
                    value: widget.from,
                    screenWidth: screenWidth),
                Expanded(child: SizedBox()),
                makeContainer(
                    label: "Date and Time",
                    value: widget.dateAndTime,
                    screenWidth: screenWidth),
              ],
            ),
            SizedBox(height: screenHeight * .05),
            Row(
              children: [
                makeContainer(
                    label: "Order Id",
                    value: widget.orderId,
                    screenWidth: screenWidth),
                Expanded(child: SizedBox()),
                makeContainer(
                    label: "Destination",
                    value: widget.destination,
                    screenWidth: screenWidth),
              ],
            ),
            SizedBox(height: screenHeight * .05),
            Row(
              children: [
                makeContainer(
                    label: "Value",
                    value: widget.value,
                    screenWidth: screenWidth),
                Expanded(child: SizedBox()),
                makeContainer(
                    label: "Description",
                    value: widget.description,
                    screenWidth: screenWidth),
              ],
            ),
            SizedBox(height: screenHeight * .05),
            Container(
                decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(15),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // width: 0,
                      child: Text(
                          "Please check all the information before \n confirming the order",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          )),
                    ),
                    Container(
                      child: Icon(
                        Icons.error,
                      ),
                    ),
                  ],
                )),
            SizedBox(height: screenHeight * .05),
            Container(
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeamLeadersPage(widget.orderId)),
                  );
                },
                color: Color.fromARGB(255, 11, 55, 132),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Forward Service Request",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * .05),
            Container(
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  changeStatus(widget.orderId, "", "rejected", context);
                },
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Reject Service Request",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}

Container makeContainer({label, value, screenWidth}) {
  return Container(
      width: screenWidth * .4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          Text(
            "$value",
            style: const TextStyle(
                color: Color.fromARGB(255, 91, 89, 89),
                fontWeight: FontWeight.w600,
                fontSize: 15),
          )
        ],
      ));
}
