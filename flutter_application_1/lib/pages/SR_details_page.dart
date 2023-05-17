import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/client_list2_page.dart';
import 'package:flutter_application_1/pages/total_service_request_page.dart';
import './pending_approval_page.dart';
import './container.dart';

class SRDetailsPage extends StatelessWidget {
  var name, service, address, rating, sr;
  SRDetailsPage(this.name, this.service, this.address, this.rating, this.sr);

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
            "SR Details",
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Icon(
            Icons.person_rounded,
            color: Color.fromARGB(255, 11, 55, 132),
            size: 50,
          ),
          SizedBox(height: 25),
          clientContainer(rating, name, service, address, sr, context)
              .makeContainer(),
          SizedBox(height: 30),
          makeContainer2(status: "Job Started"),
          Center(
            child: Container(
              width: 6,
              height: 50,
              color: Colors.black,
            ),
          ),
          makeContainer2(status: "In Progress"),
          Center(
            child: Container(
              width: 6,
              height: 50,
              color: Colors.black,
            ),
          ),
          makeContainer2(status: "Completed"),
          SizedBox(height: 20),
          tempContainer(context, PendingApprovalPage()),
        ])));
  }
}

Container makeContainer2({status, screenWidth, screenHeight}) {
  var makesign;
  if (status == "Job Started")
    makesign = Colors.blue;
  else if (status == "In Progress")
    makesign = Colors.green;
  else {
    makesign = Colors.red;
  }
  return Container(
      height: 100,
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.fromLTRB(8, 8, 14, 15),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 179, 184, 186),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$status  ",
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              Container(
                height: 12,
                width: 12,
                decoration: BoxDecoration(
                    color: makesign, borderRadius: BorderRadius.circular(20)),
              )
            ],
          ),
          SizedBox(height: 5),
          Container(
              child: Text(
            "Safe Way Company Redesign Safe Way Company Redesign",
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
          )),
        ],
      ));
}

Container tempContainer(context, route) {
  return Container(
    margin: EdgeInsets.only(top: 15),
    child: MaterialButton(
      minWidth: double.infinity,
      height: 50,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      },
      color: Color.fromARGB(255, 11, 55, 132),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      child: Text(
        "Temporary button to navigate\n next screen",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    ),
  );
}
