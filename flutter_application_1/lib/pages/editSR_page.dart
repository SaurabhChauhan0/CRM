import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/SRdetail_page.dart';
import 'createSR_page.dart';
import '/config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EditSRPage extends StatefulWidget {
  var bookingID, bookingDateTime, productDet, amt, add, contact;
  var serviceType, paymentMode;
  EditSRPage(this.bookingID, this.bookingDateTime, this.serviceType, this.add,
      this.productDet, this.contact, this.amt, this.paymentMode);

  @override
  State<EditSRPage> createState() => _EditSRPageState();
}

class _EditSRPageState extends State<EditSRPage> {
  var serviceType;
  var paymentMode;

  var bookIdController = TextEditingController();
  var bookDateController = TextEditingController();
  var prodDetController = TextEditingController();
  var amtController = TextEditingController();
  var addController = TextEditingController();
  var contactController = TextEditingController();
  // var serviceTypeController = TextEditingController();
  // var paymentModeController = TextEditingController();

  void registerSR() async {
    var regBody = {
      "bookID": bookIdController.text,
      "bookDT": bookDateController.text,
      "serviceType": serviceType,
      "add": addController.text,
      "prodDet": prodDetController.text,
      "contact": contactController.text,
      "amount": amtController.text,
      "paymentMode": paymentMode
    };
    var response = await http.post(Uri.parse(createSR),
        headers: {"Content-type": "application/json"},
        body: jsonEncode(regBody));
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Edit SR", style: TextStyle(color: Colors.grey)),
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
                  makeInput(
                      label: "Order ID",
                      details: bookIdController = widget.bookingID),
                  makeInput(
                      label: "Booking Date Time",
                      details: bookDateController = widget.bookingDateTime),
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
                      value: widget.serviceType,
                      onChanged: (String? newValueSelected) {
                        setState(() {
                          serviceType = newValueSelected!;
                        });
                      },
                      // value: currentItemSelected,
                    ),
                  ),
                  makeInput(
                      label: "Address", details: addController = widget.add),
                  makeInput(
                      label: "Product Details",
                      details: prodDetController = widget.productDet),
                  makeInput(
                      label: "Contact Number",
                      details: contactController = widget.contact),
                  makeInput(
                      label: 'Amount', details: amtController = widget.amt),
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          labelText: "Mode of Payment",
                          border: OutlineInputBorder()),
                      items: it2.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      value: widget.paymentMode,
                      onChanged: (String? newValueSelected) {
                        setState(() {
                          paymentMode = newValueSelected!;
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
                        // registerSR();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SRDetailPage()),
                        );
                      },
                      color: Color.fromARGB(255, 15, 168, 115),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Confirm Service Request",
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
        contentPadding: EdgeInsets.symmetric(vertical: 21, horizontal: 8),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        border: OutlineInputBorder(borderSide: BorderSide()),
        labelText: label,
      ),
    ),
  );
}

t() {
  return TextEditingController();
}
