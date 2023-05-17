import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/SR_details_page.dart';
import './container.dart';
import './SR_details_page.dart';

class ClientList2Page extends StatelessWidget {
  @override
  var name, service, address, rating, sr;
  ClientList2Page(this.name, this.service, this.address, this.rating, this.sr);
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.white,
          title: Text(
            "Client List",
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
          Center(
              child: Container(height: 100, width: 7, color: Colors.black54)),
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Color.fromARGB(255, 224, 227, 254),
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Container(
              height: 80,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SRDetailsPage(
                                name, service, address, rating, sr)),
                      );
                    },
                    child: Container(
                      height: 30,
                      width: screenWidth * .3,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7)),
                      margin: EdgeInsets.all(20),
                      child: Center(
                          child: Text("Accept SR",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20))),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  InkWell(
                    child: Container(
                      height: 30,
                      width: screenWidth * .3,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7)),
                      margin: EdgeInsets.all(20),
                      child: Center(
                          child: Text("Reject SR",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 20))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ])));
  }
}
