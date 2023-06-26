import 'package:flutter/material.dart';
import 'SR_track_page.dart';
import "package:get/get.dart";

class ServiceRequestDetailsPage extends StatelessWidget {
  final String id;
  final String name;
  final String address;
  final String serviceType;
  final String createdDateTime;
  final int phoneNumber;
  final String currentlyAllotted;
  final int amount;
  final String status;

  ServiceRequestDetailsPage({
    required this.id,
    required this.name,
    required this.address,
    required this.serviceType,
    required this.createdDateTime,
    required this.phoneNumber,
    required this.currentlyAllotted,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Service Request Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              _buildDetailRow('Name', name),
              _buildDetailRow('Address', address),
              _buildDetailRow('Created Date And Time', createdDateTime),
              _buildDetailRow('Service Type', serviceType),
              _buildDetailRow('Phone Number', phoneNumber),
              _buildDetailRow('Currently Allotted', currentlyAllotted),
              _buildDetailRow('Amount', amount),
              _buildDetailRow('Status', status),
              MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  Get.to(SRTrackPage(id: id, status: status));
                },
                color: const Color.fromARGB(255, 23, 201, 47),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Text(
                  "Track Service Request",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, var value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "$value",
            style: const TextStyle(fontSize: 18),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 2.0,
            endIndent: 16.0,
          ),
        ],
      ),
    );
  }
}
