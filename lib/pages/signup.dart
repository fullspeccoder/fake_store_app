import 'package:e_commerce/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupPage extends ConsumerStatefulWidget {
  const SignupPage({super.key});

  @override
  ConsumerState<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(userProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Signup", style: TextStyle(color: Colors.white)),
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
                onPressed: () {
                  notifier.signUp(
                      emailController.text, passwordController.text);
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  fixedSize: const Size(500, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Sign Up",
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(width: 10),
                  GestureDetector(
                      onTap: () {
                        Navigator.popAndPushNamed(context, '/login');
                      },
                      child: const Text("Log In")),
                ],
              )
            ],
          ),
        ));
  }
}
