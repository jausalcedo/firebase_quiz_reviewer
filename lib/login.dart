import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_quiz/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> login(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: email.text,
            password: password.text,
          )
          .then(
            (value) => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            ),
          );
    } on FirebaseAuthException catch (ex) {
      if (ex.code == "invalid-credential") {
        EasyLoading.showError("Invalid Credentials");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(
                label: Text("Email"),
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(10),
            TextField(
              controller: password,
              decoration: const InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(10),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.green),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              onPressed: () => login(context),
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
