import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/config.dart';
import './getSR.dart';
import './SRDetail_page.dart';

class PendingServiceRequestPage extends StatefulWidget {
  @override
  State<PendingServiceRequestPage> createState() =>
      _PendingServiceRequestPageState();
}

class _PendingServiceRequestPageState extends State<PendingServiceRequestPage> {
  // var data = [
  //   {"service": "Ac Install", "role": "Electrician", "address": "Mayur Vihar"},
  //   {
  //     "service": "TV Install",
  //     "role": "Mechaninc",
  //     "address": "Preet Vihar",
  //   },
  //   {"service": "RO Install", "role": "Mechanic", "address": "Mawana"},
  //   {"service": "RO Install", "role": "Mechanic", "address": "Mawana"},
  //   {"service": "RO Install", "role": "Mechanic", "address": "Mawana"},
  //   {"service": "RO Install", "role": "Mechanic", "address": "Mawana"},
  //   {"service": "RO Install", "role": "Mechanic", "address": "Mawana"},
  //   {"service": "RO Install", "role": "Mechanic", "address": "Mawana"},
  //   {"service": "RO Install", "role": "Mechanic", "address": "Mawana"},
  //   {"service": "RO Install", "role": "Mechanic", "address": "Mawana"},
  //   {"service": "RO Install", "role": "Mechanic", "address": "Mawana"},
  //   {"service": "RO Install", "role": "Mechanic", "address": "Mawana"}
  // ]

  // var respons;
  // var data = List;
  // // var userData = Map;
  // List data = [];
  // Future getStatus() async {
  //   http.Response response = await http.get(Uri.parse(statusPending));

  //   if (response.statusCode == 200) {
  //     var data1 = json.decode(response.body);
  //     data = data1;
  //   }
  // }

  // @override
  // void initState() {
  //   getStatus();
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.white,
            title: const Text("Pending Service Request",
                style: TextStyle(color: Colors.grey)),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: Colors.black,
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
                  itemCount: pendingSR.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SRDetailPage(
                                    from: pendingSR[index]["name"],
                                    dateAndTime: pendingSR[index]
                                        ["dateAndTime"],
                                    orderId: pendingSR[index]["bookingId"],
                                    value: pendingSR[index]["amount"],
                                    destination: pendingSR[index]["address"],
                                    description: pendingSR[index]
                                        ["serviceType"],
                                  )),
                        );
                      },
                      child: makeContainer(
                          service: pendingSR[index]["productDetails"],
                          role: pendingSR[index]["serviceType"],
                          address: pendingSR[index]["address"],
                          sr: index + 1,
                          contex: context),
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}

Widget makeContainer({service, role, address, sr, contex}) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: const Color.fromARGB(255, 224, 227, 254),
    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 18),
    child: Container(
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        Container(
          child: const Icon(
            Icons.person_rounded,
            color: Color.fromARGB(255, 11, 55, 132),
            size: 50,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                  child: Text(service,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20)),
                ),
                Container(
                  child: Text(
                    "$role, $address",
                    style: const TextStyle(
                        color: Color.fromARGB(255, 87, 84, 84),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 6),
                  child: Container(
                      child: const Text("Pending Request",
                          style: TextStyle(
                              color: Color.fromARGB(255, 87, 84, 84),
                              fontWeight: FontWeight.w400,
                              fontSize: 15))),
                ),
              ])),
        ),
        const SizedBox(width: 70),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(8)),
          child: Center(
              child: Text(
            "$sr",
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          )),
        )
      ]),
    ),
  );
}
