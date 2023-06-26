import 'package:get/get.dart';

class User {
  final String id;
  final String name;
  final String email;
  final int phone;
  final String role;
  final String address;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.role,
      required this.address});
}

class UserController extends GetxController {
  User? user;

  void setUser(User userDetails) {
    user = userDetails;
  }
}
