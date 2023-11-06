import 'package:flutter/material.dart';
import 'package:widget_testing/user_repository.dart';
import 'package:widget_testing/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widget Testing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UserScreen(
        fetchUsers: const UserRepository().getUsers(),
      ),
    );
  }
}
