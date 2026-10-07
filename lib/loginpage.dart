import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk menangkap input teks
  TextEditingController inputEmail = TextEditingController();
  TextEditingController inputPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Color.fromARGB(0, 50, 145, 145),
      ),
      backgroundColor: Color.fromARGB(225, 236, 125, 190),
      body: Column(
        children: [
          // Input Email / Username
          Center(
            child: Container(
              width: 300,
              color: Color.fromARGB(197, 220, 155, 155),
              child: TextField(
                controller: inputEmail,
                decoration: InputDecoration(
                  hintText: 'Masukan Email / Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),

          // Input Password
          Center(
            child: Container(
              width: 300,
              color: Color.fromARGB(197, 220, 155, 155),
              child: TextField(
                controller: inputPassword,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Masukan Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),

          // Tombol Login
          ElevatedButton(
            child: Text("Login"),
            onPressed: () {
              print("Email/Username: ${inputEmail.text}");
              print("Password: ${inputPassword.text}");
            },
          ),
        ],
      ),
    );
  }
}