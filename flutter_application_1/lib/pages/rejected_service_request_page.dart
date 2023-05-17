import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/overview_page.dart';
import 'package:flutter_application_1/pages/rejected_service_request_page.dart';
import './container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/config.dart';
import './getSR.dart';

class RejectedServiceRequestPage extends StatefulWidget {
  @override
  State<RejectedServiceRequestPage> createState() =>
      _RejectedServiceRequestPageState();
}

class _RejectedServiceRequestPageState
    extends State<RejectedServiceRequestPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.white,
            title: Text(
              "Rejected Service Request",
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
                    return SRcontainer("Rejected Service Request")
                        .makeContainer(
                            service: data[index]["prodDet"],
                            role: data[index]["serviceType"],
                            address: data[index]["add"],
                            sr: index + 1,
                            contex: context);
                  },
                  itemCount: data.length,
                ),
              )
            ],
          )),
    );
  }
}
