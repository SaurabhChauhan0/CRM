import 'package:flutter/material.dart';

class SRcontainer {
  var status;
  SRcontainer(status) {
    this.status = status;
  }
  Widget makeContainer({service, role, address, sr, contex}) {
    double screenWidth = MediaQuery.of(contex).size.width;
    double screenHeight = MediaQuery.of(contex).size.height;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Color.fromARGB(255, 224, 227, 254),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(children: [
          Container(
            child: Icon(
              Icons.person_rounded,
              color: Color.fromARGB(255, 11, 55, 132),
              size: 50,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(
                    child: Text(service,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                  ),
                  Container(
                    child: Text(
                      "$role,$address",
                      style: TextStyle(
                          color: Color.fromARGB(255, 87, 84, 84),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 6),
                    child: Container(
                        child: Text(status,
                            style: TextStyle(
                                color: Color.fromARGB(255, 87, 84, 84),
                                fontWeight: FontWeight.w400,
                                fontSize: 15))),
                  ),
                ])),
          ),
          SizedBox(width: screenWidth * .17),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: Text(
              "SR $sr",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            )),
          )
        ]),
      ),
    );
  }
}

class clientContainer {
  var rating;
  var name;
  var service;
  var address;
  var sr;
  var cont;
  clientContainer(rating, name, service, address, sr, cont) {
    this.rating = rating;
    this.name = name;
    this.service = service;
    this.address = address;
    this.sr = sr;
    this.cont = cont;
  }

  Widget makeIcon() {
    return Row(
      children: [
        for (int i = 0; i < rating; i++)
          const Icon(
            Icons.star_border,
            color: Color.fromARGB(255, 159, 144, 13),
          )
      ],
    );
  }

  Widget makeContainer() {
    double screenWidth = MediaQuery.of(cont).size.width;
    double screenHeight = MediaQuery.of(cont).size.height;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Color.fromARGB(255, 224, 227, 254),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(children: [
          Container(
            child: Icon(
              Icons.person_rounded,
              color: Color.fromARGB(255, 11, 55, 132),
              size: 50,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(name,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                  Container(
                    child: Text(
                      "$service,$address",
                      style: TextStyle(
                          color: Color.fromARGB(255, 87, 84, 84),
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 6),
                    child: makeIcon(),
                  ),
                ])),
          ),
          SizedBox(width: screenWidth * .17),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: Text(
              "SR $sr",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            )),
          )
        ]),
      ),
    );
  }
}
