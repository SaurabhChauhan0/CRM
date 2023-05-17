import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/client_list2_page.dart';
import 'package:flutter_application_1/pages/rejected_service_request_page.dart';
import './container.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/config.dart';
import './getSR.dart';
import './client_list2_page.dart';

class ClientListPage extends StatelessWidget {
  @override
  var rating = 3,
      name = "Sunil Kumar",
      service = "Mechanic",
      address = "Mawana";

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 5,
            backgroundColor: Colors.white,
            title: Text(
              "Client List Page",
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
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ClientList2Page(
                              name, service, address, rating, 1)),
                    );
                  },
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return clientContainer(rating, name, service, address,
                              index + 1, context)
                          .makeContainer();
                    },
                    itemCount: data.length,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
