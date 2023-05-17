import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import '/config.dart';
import 'package:http/http.dart' as http;
import '/pages/login_page.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String dropdownValue = '';
  // var currentItemSelected = 'Manager';

  var it = [
    'General Manager',
    'Manager',
    'Team Leader',
    'Supervisor',
  ];

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var addressController = TextEditingController();

  var passwordController = TextEditingController();

  void registerUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var regBody = {
        "name": nameController.text,
        "email": emailController.text,
        "phone": phoneController.text,
        "address": addressController.text,
        "password": passwordController.text,
        "role": dropdownValue,
      };
      var response = await http.post(Uri.parse(registration),
          headers: {"Content-type": "application/json"},
          body: jsonEncode(regBody));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Register With Us",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          makeInput(label: "Name", details: nameController),
                          makeInput(label: "Email", details: emailController),
                          makeInput(
                              label: "Phone No.", details: phoneController),
                          makeInput(
                              label: "Address", details: addressController),
                          makeInput(
                              label: "Password",
                              details: passwordController,
                              obsureText: true),
                          Container(
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                  labelText: "Role",
                                  border: UnderlineInputBorder()),
                              items: it.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(dropDownStringItem),
                                );
                              }).toList(),
                              onChanged: (String? newValueSelected) {
                                setState(() {
                                  dropdownValue = newValueSelected!;
                                });
                              },
                              // value: currentItemSelected,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Container(
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            registerUser();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          color: Color.fromARGB(255, 11, 55, 132),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Text(
                            "Register Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextButton(
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 11, 55, 132),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            }),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, details, obsureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // SizedBox(
      //   height: 5,
      // ),
      TextField(
        obscureText: obsureText,
        controller: details,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          border: UnderlineInputBorder(),
          labelText: label,
        ),
      ),
      SizedBox(
        height: 30,
      )
    ],
  );
}
