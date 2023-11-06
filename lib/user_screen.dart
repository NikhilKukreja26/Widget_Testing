import 'package:flutter/material.dart';
import 'package:widget_testing/user_model.dart';
import 'package:widget_testing/user_repository.dart';

class UserScreen extends StatefulWidget {
  final Future<List<UserModel>> fetchUsers;
  const UserScreen({
    super.key,
    required this.fetchUsers,
  });

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UserRepository userRepository = const UserRepository();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: FutureBuilder<List<UserModel>>(
        future: widget.fetchUsers,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final List<UserModel> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(users[index].name),
                  subtitle: Text(users[index].email),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
