import 'package:flutter/material.dart';

class ProjectApprovalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        title: Text("Project Approval"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Colors.black,
            )),
      ),
      // Sets the content to the
      // center of the application page
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              makeContainer(no: 123, status: "Project Approved"),
              makeContainer(no: 1000, status: "Project Approved")
            ],
          ),
          const SizedBox(height: 20),
          makeContainer(no: 200, status: "Project Reject"),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 11, 55, 132),
                borderRadius: BorderRadius.circular(15)),
            width: 370,
            height: 150,
            child: Center(
              child: const Text(
                'Call us now for service assistance \n 8957493847',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 50,
            width: 370,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Search Service request id',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 370,
            child: MaterialButton(
              minWidth: double.infinity,
              height: 50,
              onPressed: () {},
              color: Color.fromARGB(255, 11, 55, 132),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
              child: Text(
                "Create Service Request",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      )
      // Sets the content of the Application
      ,
    );
  }
}

Container makeContainer({no, status}) {
  return Container(
      width: 140,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromARGB(133, 194, 190, 190),
      ),
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: Icon(
                  Icons.book,
                  weight: 20,
                ),
              ),
              Text(
                "$no",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              )
            ],
          ),
          Container(
              child: Text("$status",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500)))
        ],
      ));
}
