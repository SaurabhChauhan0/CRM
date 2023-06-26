import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/overview_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import '/config.dart';
import '/pages/pending_service_request_page.dart';
import 'package:flutter_application_1/currently_allotted_service_request_page.dart';
import './getSR.dart';
import '/change_sr_status.dart';

class TeamLeadersPage extends StatefulWidget {
  var serviceRequestId;
  TeamLeadersPage(
    this.serviceRequestId,
  );
  @override
  _TeamLeadersPageState createState() => _TeamLeadersPageState();
}

class _TeamLeadersPageState extends State<TeamLeadersPage> {
  List<TeamLeader> _teamLeaders = [
    TeamLeader(1, 'John Doe', 'Address 1', 'Service Type A'),
    TeamLeader(2, 'Jane Smith', 'Address 2', 'Service Type B'),
    TeamLeader(3, 'John Doe', 'Address 1', 'Service Type C'),
    TeamLeader(4, 'Jane Smith', 'Address 2', 'Service Type D'),
    TeamLeader(5, 'John Doe', 'Address 1', 'Service Type E'),
    TeamLeader(6, 'Jane Smith', 'Address 2', 'Service Type F'),
    TeamLeader(1, 'John Doe', 'Address 1', 'Service Type A'),
    TeamLeader(2, 'Jane Smith', 'Address 2', 'Service Type B'),
    TeamLeader(3, 'John Doe', 'Address 1', 'Service Type C'),
    TeamLeader(4, 'Jane Smith', 'Address 2', 'Service Type D'),
    TeamLeader(5, 'John Doe', 'Address 1', 'Service Type E'),
    TeamLeader(6, 'Jane Smith', 'Address 2', 'Service Type F'),
    // Add more team leaders here
  ];

  // var allotted;

  int _selectedTeamLeaderIndex = -1;
  String _searchId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Team Leaders'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search by ID',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      _searchId = '';
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _searchId = value;
                });
              },
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemCount: _teamLeaders.length,
              itemBuilder: (context, index) {
                final teamLeader = _teamLeaders[index];
                final isSelected = index == _selectedTeamLeaderIndex;

                // Filter team leaders by ID if search ID is provided
                if (_searchId.isNotEmpty &&
                    !teamLeader.id.toString().startsWith(_searchId)) {
                  return SizedBox
                      .shrink(); // Hide the tile if ID doesn't match the search
                }

                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    title: Text(teamLeader.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID: ${teamLeader.id}'),
                        Text('Address: ${teamLeader.address}'),
                        Text('Service Type: ${teamLeader.serviceType}'),
                      ],
                    ),
                    onTap: () {
                      setState(() {
                        _selectedTeamLeaderIndex = index;
                      });
                    },
                    tileColor: isSelected ? Colors.blue : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _selectedTeamLeaderIndex == -1 ? null : assignServiceRequest,
        label: Text('Assign Service Request'),
        icon: Icon(Icons.assignment_turned_in),
      ),
    );
  }

  void assignServiceRequest() {
    // Perform the assignment of the service request to the selected team leader
    final selectedTeamLeaderId = _teamLeaders[_selectedTeamLeaderIndex].id;
    changeStatus(
        widget.serviceRequestId, selectedTeamLeaderId, "pending", context);

    // Implement your logic here to assign the service request to the selected team leader
    // You can use the `selectedTeamLeader` object to access the details of the selected team leader.
  }
}

class TeamLeader {
  final int id;
  final String name;
  final String address;
  final String serviceType;

  TeamLeader(this.id, this.name, this.address, this.serviceType);
}
