import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.user});

  final dynamic user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("First Name: ${user["firstname"]}"),
            Text("Last Name: ${user["lastname"]}"),
            Text("Address: ${user["address"]}"),
            Text("Age: ${user["age"]}"),
          ],
        ),
      ),
    );
  }
}