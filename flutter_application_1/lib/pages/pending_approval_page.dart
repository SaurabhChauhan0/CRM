import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/client_list_page.dart';
import 'package:flutter_application_1/pages/payment_details_page.dart';
import './SR_details_page.dart';

import './payment_details_page.dart';

class PendingApprovalPage extends StatelessWidget {
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
          "Pending Approval Page",
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
                    value: 'arun prajapati-232sdfs',
                    screenWidth: screenWidth),
                Expanded(child: SizedBox()),
                makeContainer(
                    label: "Transaction No.",
                    value: '2343435454545',
                    screenWidth: screenWidth),
              ],
            ),
            SizedBox(height: screenHeight * .05),
            Row(
              children: [
                makeContainer(
                    label: "Order Id",
                    value: 'ordrs 1235',
                    screenWidth: screenWidth),
                Expanded(child: SizedBox()),
                makeContainer(
                    label: "Destination",
                    value: 'Mayur Vihar',
                    screenWidth: screenWidth),
              ],
            ),
            SizedBox(height: screenHeight * .05),
            Row(
              children: [
                makeContainer(
                    label: "Value", value: '20,000', screenWidth: screenWidth),
                Expanded(child: SizedBox()),
                makeContainer(
                    label: "Description",
                    value: "AC Installation",
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClientListPage()),
                  );
                },
                color: Color.fromARGB(255, 11, 55, 132),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Confirm Order",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            tempContainer(context, PaymentDetailsPage()),
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
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 12),
          )
        ],
      ));
}
