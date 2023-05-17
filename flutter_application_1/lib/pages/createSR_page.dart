import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/editSR_page.dart';

class CreateSRPage extends StatefulWidget {
  @override
  State<CreateSRPage> createState() => _CreateSRPageState();
}

class _CreateSRPageState extends State<CreateSRPage> {
  var serviceType;
  var paymentMode;

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

  var bookingOrderId = TextEditingController();

  var bookingDateTime = TextEditingController();

  var address = TextEditingController();

  var productDetails = TextEditingController();

  var contact = TextEditingController();

  var amount = TextEditingController();

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
                  makeInput(label: "Booking Order ID", details: bookingOrderId),
                  makeInput(
                      label: "Booking Date Time", details: bookingDateTime),
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
                  makeInput(label: "Address", details: address),
                  makeInput(label: "Product Details", details: productDetails),
                  makeInput(label: "Contact Number", details: contact),
                  makeInput(label: 'Amount', details: amount),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditSRPage(
                                  bookingOrderId,
                                  bookingDateTime,
                                  serviceType,
                                  address,
                                  productDetails,
                                  contact,
                                  amount,
                                  paymentMode)),
                        );
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
