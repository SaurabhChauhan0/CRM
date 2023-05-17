import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/overview_page.dart';
import 'package:flutter_application_1/pages/signup_page.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:convert';
import '/config.dart';

class LoginPage extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // void registerUser() async {
  //   if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
  //     var regBody = {
  //       "email": emailController.text,
  //       "password": passwordController.text
  //     };
  //     var response = await http.post(Uri.parse(registration),
  //         headers: {"Content-type": "application/json"},
  //         body: jsonEncode(regBody));
  //   }
  // }

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Color.fromRGBO(23, 2, 2, 1),
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]),

              Container(
                child: Image.asset(
                  'asset/images/login_image.png',
                  width: 300,
                  height: 200,
                ),
              ),

              /*email*/ SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email or Phone number',
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /*password*/ SizedBox(
                width: double.infinity,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: const Icon(
                      Icons.remove_red_eye,
                    ),
                    prefixIcon: const Icon(
                      Icons.lock,
                    ),
                  ),
                ),
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
                    // print(emailController.text);
                    // print(passwordController.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OverviewPage()),
                    );
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
