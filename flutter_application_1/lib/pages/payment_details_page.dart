import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

import 'package:flutter_application_1/pages/project_approval_page.dart';

import './SR_details_page.dart';

class PaymentDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        title: Text(
          "Payment Details",
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
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: screenHeight * .2,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 112, 61, 222),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      SizedBox(
                          height: screenHeight * .2, width: screenWidth * .05),
                      Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 25),
                              Container(
                                  height: 30,
                                  width: screenWidth * .3,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text("22/12/2023",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600)),
                                  )),
                              Expanded(child: SizedBox()),
                              Container(
                                  child: Text("Total Account Balance",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white))),
                              Container(
                                  margin: EdgeInsets.only(top: 8, bottom: 20),
                                  child: Text(
                                    "10,23,234",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Colors.white),
                                  )),
                            ]),
                      ),
                      Expanded(
                        child: SizedBox(
                            // width: 80,
                            ),
                      ),
                      Container(
                          padding: EdgeInsets.all(screenWidth * .05),
                          child: CircularPercentIndicator(
                            radius: 110.0,
                            lineWidth: 8.0,
                            percent: 0.8,
                            center: new Text("80%",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                            progressColor: Colors.white,
                          ))
                    ],
                  )),
              SizedBox(height: 40),
              Text(
                "Recent Activity",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(height: 10),
              makeContainer(
                  name: "Sunil Kumar",
                  date: "12/10/23",
                  fee: "30000",
                  screenWidth: screenWidth),
              makeContainer(
                  name: "Sunil Kumar",
                  date: "12/10/23",
                  fee: "10000",
                  screenWidth: screenWidth),
              tempContainer(context, ProjectApprovalPage()),
            ],
          ),
        ),
      )),
    );
  }
}

Card makeContainer({name, date, fee, screenWidth}) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: Color.fromARGB(255, 224, 227, 254),
    margin: EdgeInsets.only(bottom: 20),
    child: Container(
      padding: EdgeInsets.all(10),
      color: Color.fromARGB(255, 179, 184, 186),
      child: Row(children: [
        Container(
          child: Icon(
            Icons.person_rounded,
            color: Color.fromARGB(255, 11, 55, 132),
            size: 50,
          ),
        ),
        SizedBox(width: 10),
        Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Text(name,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 20)),
          ),
          Container(
            child: Text(
              date,
              style: TextStyle(
                  color: Color.fromARGB(255, 87, 84, 84),
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          ),
        ])),
        Expanded(child: SizedBox()),
        Container(
          width: screenWidth * 0.25,
          child: Center(
              child: Text("$fee",
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                      fontSize: 15))),
        )
      ]),
    ),
  );
}
