import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_quiz/firebase_options.dart';
import 'package:firebase_quiz/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const FirebaseQuiz());
}

class FirebaseQuiz extends StatelessWidget {
  const FirebaseQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      builder: EasyLoading.init(),
    );
  }
}