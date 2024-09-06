import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black87,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Email"),
              ),
              const SizedBox(height: 18),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    hintText: "Password"),
              ),
              const SizedBox(height: 18),
              TextButton(
                onPressed: null,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  fixedSize: const Size(500, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child:
                    const Text("Log In", style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(width: 10),
                  Text("Sign Up"),
                ],
              )
            ],
          ),
        ));
  }
}
