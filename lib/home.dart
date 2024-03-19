import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_quiz/details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection('users').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final listOfUsers = snapshot.data!.docs;

            return ListView.builder(
              itemCount: listOfUsers.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          UserDetails(user: listOfUsers[index]),
                    ),
                  ),
                  title: Text(listOfUsers[index]["firstname"] +
                      " " +
                      listOfUsers[index]["lastname"]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
