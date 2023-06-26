import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/client_list2_page.dart';
import 'package:flutter_application_1/pages/total_service_request_page.dart';
import 'package:mongo_dart/mongo_dart.dart';
import './pending_approval_page.dart';
import './container.dart';

class ServiceRequest {
  final String id;
  final String createdAt;
  final String generalManager;
  final String manager;
  final String teamLeader;
  final String supervisor;

  ServiceRequest({
    required this.id,
    required this.createdAt,
    required this.generalManager,
    required this.manager,
    required this.teamLeader,
    required this.supervisor,
  });
}

// Dummy data for demonstration purposes

class SRTrackPage extends StatelessWidget {
  final String id;
  final String status;
  SRTrackPage({required this.id, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    if (status == "pending") {
      color = Colors.green;
    } else if (status == "rejected") {
      color = Colors.red;
    } else
      color = Colors.blue;
    List<ServiceRequest> dummyServiceRequests = [
      ServiceRequest(
        id: 'SR001',
        // createdAt: DateTime.parse('2023-06-01 10:00:00'),
        createdAt: "date",
        generalManager: 'John Doe',
        manager: 'John Smith',
        teamLeader: "",
        supervisor: "",
      ),
    ];

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.white,
          title: Text(
            "SR Track",
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
          const Icon(
            Icons.person_rounded,
            color: Color.fromARGB(255, 11, 55, 132),
            size: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(20)),
              ),
              const SizedBox(width: 3),
              Container(
                width: screenWidth * .5,
                child: Text(
                  status,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          SRcontainer(status).makeContainer(
              service: "Mechanic",
              role: "Mechanic",
              address: "Meerut",
              color: Colors.white,
              contex: context),
          makeContainer1(
            role: "General Manager",
            name: dummyServiceRequests[0].generalManager,
          ),
          makeContainer1(
              role: "Manager", name: dummyServiceRequests[0].manager),
          makeContainer1(
              role: "Team Leader", name: dummyServiceRequests[0].teamLeader),
          makeContainer1(
              role: "Supervisor", name: dummyServiceRequests[0].supervisor)
        ])));
  }
}

Widget makeContainer1({role, name, timeStamp, screenWidth, screenHeight}) {
  return Column(
    children: [
      Container(height: screenHeight, width: 7, color: Colors.black),
      Container(
          height: 100,
          margin: EdgeInsets.only(left: 20, right: 20),
          padding: EdgeInsets.fromLTRB(8, 8, 14, 15),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 179, 184, 186),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text(role,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500)),
              const ListTile(
                  leading: Text("name"), trailing: Text("timeStamp")),
            ],
          )),
    ],
  );
}
