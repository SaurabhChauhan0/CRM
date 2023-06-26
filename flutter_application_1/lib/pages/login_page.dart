import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/overview_page.dart';
import 'package:flutter_application_1/pages/signup_page.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:convert';
import '/config.dart';
import './getSR.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/currently_logged_in_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  // bool _isNotValidate = false;
  final UserController userController = Get.find();

  void loginUser() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text
      };
      var response = await http.post(Uri.parse(login),
          headers: {"Content-type": "application/json"},
          body: jsonEncode(reqBody));
      // if (response != 200) print("fd");
      // if (jsonResponse['status']) {
      // void initState() {
      //   GetSR().getStatus();
      //   super.initState();
      // }
      if (response.statusCode == 200) {
        // var jsonResponse = jsonDecode(response.body);
        final userData = jsonDecode(response.body);
        final user = User(
          id: userData["userDetails"]["id"],
          name: userData["userDetails"]["name"],
          email: userData["userDetails"]["email"],
          phone: userData["userDetails"]["phone"],
          role: userData["userDetails"]['role'],
          address: userData["userDetails"]["address"],
        );
        userController.setUser(user);
        String userEmail = userData['userDetails']['email'];
        String userToken = userData['token'];

        saveUserAuthDetails(userEmail, userToken);

        Get.snackbar(
          'Success',
          'Logged in successfully!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 2),
          borderRadius: 10.0,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          animationDuration: Duration(milliseconds: 300),
          isDismissible: true,
          // dismissDirection: SnackDismissDirection.HORIZONTAL,
          forwardAnimationCurve: Curves.easeOut,
          reverseAnimationCurve: Curves.easeIn,
          icon: Icon(
            Icons.check_circle_outline,
            color: Colors.white,
          ),
          shouldIconPulse: true,
          mainButton: TextButton(
            onPressed: () {
              Get.back(); // Dismiss the snackbar
            },
            child: Text(
              'OK',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        // GetSR().getStatus();
        Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => OverviewPage()));
        });
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Authentication Failed'),
              content: Text(
                'Invalid username or password !',
                style: const TextStyle(
                    color: Colors.redAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    } else {}
  }

  Future<void> saveUserAuthDetails(String userEmail, String userToken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString('userEmail', userEmail);
    await pref.setString('userToken', userToken);
  }

  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(
                  color: Color.fromRGBO(23, 2, 2, 1),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Row(
                children: [
                  Center(
                    child: Image.asset(
                      'asset/images/login_image.png',
                      // width: 300,
                      height: 180,
                    ),
                  ),
                ],
              ),

              /*email*/ Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      // autovalidateMode: ,
                      // validator: EmailValidator(errorText: "Please enter valid email address"),
                      validator: MultiValidator([
                        // RequiredValidator(
                        //     errorText: "Username can't be empty"),
                        // EmailValidator(
                        //     errorText: "Please Enter Valid Email Address"),
                      ]),

                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      keyboardType: TextInputType.visiblePassword,
                      validator: RequiredValidator(
                          errorText: "Password can't be empty"),
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /*password*/ SizedBox(
                width: double.infinity,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      child: const Text(
                        'Forgot password?',
                        style:
                            TextStyle(color: Color.fromARGB(255, 11, 55, 132)),
                      ),
                      onPressed: () {}),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              /*login*/ Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 11, 55, 132),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 50,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate())
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => SignupPage()),
                    // );
                    {
                      loginUser();
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              //
              //
              //

              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                  ),
                  TextButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Color.fromARGB(255, 11, 55, 132)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
