import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();


void login(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse('https://reqres.in/api/register'),
      headers: {'Content-Type': 'application/json'}, // Add this header
      body: jsonEncode({ // Use jsonEncode to format as JSON
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      print('Account created successfully: ${response.body}');
    } else {
      print('Failed with status ${response.statusCode}: ${response.body}');
    }
  } catch (e) {
    print('Error: ${e.toString()}'); // Fixed toString() call
  }
}



class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Api'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',

              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: (){
              login(
                emailController.text.toString(),
                passwordController.text.toString(),
              );
            },
            child: Container(
              height: 45,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text('Signup')),
            ),
          )
        ],
      ),
    );
  }
}
