import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/createSR_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/config.dart';
import './pending_service_request_page.dart';
import './total_service_request_page.dart';
import './rejected_service_request_page.dart';
import './complete_service_request_page.dart';
import './getSR.dart';

class OverviewPage extends StatefulWidget {
  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  void initState() {
    GetSR().getStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var totalPending = data.length,
        totalReject = 0,
        totalComplete = 0,
        totalRequest = data.length;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double gapSize = screenHeight * .02;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Overview",
            style: TextStyle(color: Colors.grey),
          ),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              )),
        ),
        // Sets the content to the
        // center of the application page
        body: Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    makeContainer(
                        no: totalRequest,
                        status: "Total Service Request",
                        cont: context,
                        pageRoute: TotalServiceRequestPage(),
                        screenWidth: screenWidth,
                        screenHeight: screenHeight),
                    Expanded(child: SizedBox()),
                    makeContainer(
                        no: totalComplete,
                        status: "Complete Service Request",
                        cont: context,
                        pageRoute: CompleteServiceRequestPage(),
                        screenWidth: screenWidth,
                        screenHeight: screenHeight),
                  ],
                ),
                SizedBox(height: gapSize),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    makeContainer(
                        no: totalPending,
                        status: "Pending Service Request",
                        cont: context,
                        pageRoute: PendingServiceRequestPage(),
                        screenWidth: screenWidth,
                        screenHeight: screenHeight),
                    Expanded(child: SizedBox()),
                    makeContainer(
                        no: totalReject,
                        status: "Rejected Service Request",
                        cont: context,
                        pageRoute: RejectedServiceRequestPage(),
                        screenWidth: screenWidth,
                        screenHeight: screenHeight),
                  ],
                ),
                SizedBox(height: gapSize),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 11, 55, 132),
                      borderRadius: BorderRadius.circular(10)),
                  height: screenHeight * .16,
                  child: Center(
                    child: const Text(
                      'Call us now for service assistance \n 8957493847',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: gapSize),
                Container(
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Search Service request id',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: gapSize),
                Container(
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreateSRPage()),
                      );
                    },
                    color: Color.fromARGB(255, 11, 55, 132),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Create Service Request",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: gapSize),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 11, 55, 132),
                      borderRadius: BorderRadius.circular(10)),
                  height: screenHeight * .16,
                  child: Center(
                    child: const Text(
                      'Project Approval \n 8957493847',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget makeContainer({no, status, cont, pageRoute, screenWidth, screenHeight}) {
  return InkWell(
    onTap: () {
      Navigator.push(
        cont,
        MaterialPageRoute(builder: (context) => pageRoute),
      );
    },
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Container(
          width: screenWidth * .4,
          height: screenHeight * .1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // color: Color.fromARGB(133, 194, 190, 190),
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    child: Icon(
                      Icons.book,
                      weight: 20,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "$no",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Container(
                  child: Text("$status",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500)))
            ],
          )),
    ),
  );
}
