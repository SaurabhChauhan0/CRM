import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/editSR_page.dart';
import 'package:flutter_application_1/pages/overview_page.dart';
import '/config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CreateSRPage extends StatefulWidget {
  @override
  State<CreateSRPage> createState() => _CreateSRPageState();
}

class _CreateSRPageState extends State<CreateSRPage> {
  var serviceType;
  var modeOfPayment;
  var allotted;

  var it1 = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var it2 = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var it3 = ["UPI", "Debit Card", "Net Banking"];

  var name = TextEditingController();

  var address = TextEditingController();

  // var allotted = TextEditingController();

  var productDetails = TextEditingController();

  var contactNumber = TextEditingController();

  var amount = TextEditingController();
  void registerSR() async {
    var regBody = {
      "name": name.text,
      "address": address.text,
      "serviceType": serviceType,
      "allotted": allotted,
      "productDetails": productDetails.text,
      "contactNumber": contactNumber.text,
      "amount": amount.text,
      "modeOfPayment": modeOfPayment,
    };
    var response = await http.post(Uri.parse(createSR),
        headers: {"Content-type": "application/json"},
        body: jsonEncode(regBody));
    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            // title: const Text('Error'),
            content: Text(
              'SR Registered Successfully !',
              style: const TextStyle(
                  color: Color.fromARGB(255, 60, 218, 25),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OverviewPage()));
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Create SR", style: TextStyle(color: Colors.grey)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.grey,
            )),
      ),
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 23, 12, 0),
              child: Column(
                children: [
                  makeInput(label: "Name", details: name),
                  makeInput(label: "Address", details: address),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          labelText: "Service Type",
                          border: OutlineInputBorder()),
                      items: it1.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String? newValueSelected) {
                        setState(() {
                          serviceType = newValueSelected!;
                        });
                      },
                      // value: currentItemSelected,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          labelText: "Allotted", border: OutlineInputBorder()),
                      items: it2.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String? newValueSelected) {
                        setState(() {
                          allotted = newValueSelected!;
                        });
                      },
                      // value: currentItemSelected,
                    ),
                  ),
                  makeInput(label: "Product Details", details: productDetails),
                  makeInput(label: "Contact Number", details: contactNumber),
                  makeInput(label: 'Amount', details: amount),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          labelText: "Mode of Payment",
                          border: OutlineInputBorder()),
                      items: it3.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      onChanged: (String? newValueSelected) {
                        setState(() {
                          modeOfPayment = newValueSelected!;
                        });
                      },
                      // value: currentItemSelected,
                    ),
                  ),
                  Container(
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => EditSRPage(
                        //           bookingOrderId,
                        //           bookingDateTime,
                        //           serviceType,
                        //           address,
                        //           productDetails,
                        //           contact,
                        //           amount,
                        //           paymentMode)),
                        // );

                        registerSR();
                      },
                      color: Color.fromARGB(255, 11, 55, 132),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Create Service Request",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, details, obsureText = false}) {
  return Container(
    margin: EdgeInsets.only(bottom: 15),
    child: TextField(
      controller: details,
      obscureText: obsureText,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        border: OutlineInputBorder(borderSide: BorderSide()),
        labelText: label,
      ),
    ),
  );
}
