import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/createSR_page.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '/config.dart';
import './pending_service_request_page.dart';
import './total_service_request_page.dart';
import './rejected_service_request_page.dart';
import './complete_service_request_page.dart';
import './getSR.dart';
import './login_page.dart';
import './profile_page.dart';
import 'package:flutter_application_1/currently_logged_in_user.dart';
import "package:get/get.dart";
import "/currently_allotted_service_request_page.dart";
import 'package:shared_preferences/shared_preferences.dart';

class OverviewPage extends StatefulWidget {
  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  // void initState() {
  //   super.initState();
  //   GetSR().getStatus();
  // }

  Future<String?> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userToken');
  }

  Future<String?> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userEmail');
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    // Navigate back to the login page
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    var totalRequest = totalSR.length,
        totalPending = pendingSR.length,
        totalReject = rejectedSR.length,
        totalComplete = completedSR.length,
        currentlyAllotted = currentlyAllottedSR.length;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double gapSize = screenHeight * .02;

    final UserController userController = Get.find<UserController>();
    final userId = userController.user?.id;
    final userName = userController.user?.name;
    final userEmail = userController.user?.email;
    final userPhone = userController.user?.phone;
    final userAddress = userController.user?.address;
    final userRole = userController.user?.role;

    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          title: const Text(
            "Overview",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        drawer: Drawer(
          width: screenWidth * .6,
          backgroundColor: Colors.white,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                accountName: Text('John Doe'),
                accountEmail: Text('johndoe@example.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('asset/images/dummy.png'),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.image,
                ),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserProfilePage(
                                name: userName!,
                                email: userEmail!,
                                phone: userPhone!,
                                profileImage: 'asset/images/dummy.png',
                                address: userAddress!,
                                role: userRole!,
                                password: "7947387",
                                skills: const [
                                  'Flutter',
                                  'Mobile Development',
                                  'Travel'
                                ],
                              )));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                ),
                title: const Text('Logout'),
                onTap: () {
                  // Navigator.pop(context);
                  logout();
                  // Navigator.pushReplacementNamed(context, '/login_page.dart');
                },
              ),
            ],
          ),
        ),
        // Sets the content to the
        // center of the application page
        body: FutureBuilder(
            future: GetSR().getStatus(),
            builder: (context, snapshot) {
              return Container(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          makeContainer(
                              no: totalRequest,
                              status: "Total Service   Request",
                              cont: context,
                              pageRoute: TotalServiceRequestPage(),
                              screenWidth: screenWidth,
                              screenHeight: screenHeight),
                          const Expanded(child: SizedBox()),
                          makeContainer(
                              no: totalComplete,
                              status: "Completed Service Request",
                              cont: context,
                              pageRoute: CompleteServiceRequestPage(),
                              screenWidth: screenWidth,
                              screenHeight: screenHeight),
                        ],
                      ),
                      SizedBox(height: gapSize),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          makeContainer(
                              no: totalPending,
                              status: "Pending Service Request",
                              cont: context,
                              pageRoute: PendingServiceRequestPage(),
                              screenWidth: screenWidth,
                              screenHeight: screenHeight),
                          const Expanded(child: SizedBox()),
                          makeContainer(
                              no: totalReject,
                              status: "Rejected Service Request",
                              cont: context,
                              pageRoute: RejectedServiceRequestPage(),
                              screenWidth: screenWidth,
                              screenHeight: screenHeight),
                        ],
                      ),
                      SizedBox(height: gapSize),
                      makeContainer(
                          no: currentlyAllotted,
                          status: "Currently Allotted Service Request",
                          cont: context,
                          pageRoute: CurrentlyAllottedServiceRequestPage(),
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                          color: Color.fromARGB(255, 219, 248, 234)),
                      SizedBox(height: gapSize),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 11, 55, 132),
                            borderRadius: BorderRadius.circular(10)),
                        height: screenHeight * .16,
                        child: const Center(
                          child: Text(
                            'Call us now for service assistance \n 8957493847',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: gapSize),
                      Container(
                        height: 50,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Search Service request id',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: gapSize),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateSRPage()),
                          );
                        },
                        color: const Color.fromARGB(255, 11, 55, 132),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          "Create Service Request",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: gapSize),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 11, 55, 132),
                            borderRadius: BorderRadius.circular(10)),
                        height: screenHeight * .16,
                        child: const Center(
                          child: Text(
                            'Project Approval \n 8957493847',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}

Widget makeContainer(
    {no, status, cont, pageRoute, screenWidth, screenHeight, color}) {
  return InkWell(
    onTap: () {
      Navigator.push(
        cont,
        MaterialPageRoute(builder: (context) => pageRoute),
      );
    },
    child: Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Container(
          width: screenWidth * .4,
          height: screenHeight * .13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // color: Color.fromARGB(133, 194, 190, 190),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    child: const Icon(
                      Icons.book,
                      weight: 20,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "$no",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              Container(
                  child: Text("$status",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500)))
            ],
          )),
    ),
  );
}
