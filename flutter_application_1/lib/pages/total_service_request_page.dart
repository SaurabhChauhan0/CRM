import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/new_service_request_details_page.dart';
import 'package:flutter_application_1/pages/rejected_service_request_page.dart';
import './container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/config.dart';
import './getSR.dart';
import './SRDetail_page.dart';

class TotalServiceRequestPage extends StatefulWidget {
  @override
  State<TotalServiceRequestPage> createState() =>
      _TotalServiceRequestPageState();
}

class _TotalServiceRequestPageState extends State<TotalServiceRequestPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.white,
            title: Text(
              "Total Service Request",
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
          body: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(
                    Icons.person_rounded,
                    color: Color.fromARGB(255, 11, 55, 132),
                    size: 55,
                  ),
                  SizedBox(width: 35)
                ],
              ),

              // SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    Color color = Color.fromARGB(255, 174, 199, 240);
                    var status = "Completed";
                    if (totalSR[index]["status"] == "pending") {
                      color = Color.fromARGB(255, 179, 241, 211);
                      status = "Pending";
                    } else if (totalSR[index]["status"] == "rejected") {
                      color = Color.fromARGB(255, 231, 176, 176);
                      status = "Rejected";
                    }
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ServiceRequestDetailsPage(
                                    id: totalSR[index]['bookingId'],
                                    name: totalSR[index]['name'],
                                    address: totalSR[index]['address'],
                                    createdDateTime: totalSR[index]
                                        ["dateAndTime"],
                                    serviceType: totalSR[index]['serviceType'],
                                    phoneNumber: totalSR[index]
                                        ['contactNumber'],
                                    currentlyAllotted: totalSR[index]
                                        ['allotted'],
                                    amount: totalSR[index]['amount'],
                                    status: totalSR[index]['status'],
                                  )),
                        );
                      },
                      child: SRcontainer(status).makeContainer(
                          service: totalSR[index]["productDetails"],
                          role: totalSR[index]["serviceType"],
                          address: totalSR[index]["address"],
                          sr: index + 1,
                          contex: context,
                          color: color),
                    );
                  },
                  itemCount: totalSR.length,
                ),
              )
            ],
          )),
    );
  }
}
