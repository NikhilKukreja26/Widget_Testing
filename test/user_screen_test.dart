import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_testing/user_model.dart';
import 'package:widget_testing/user_screen.dart';

void main() {
  testWidgets(
    'Displays List Of Users With Title as Name and Subtitle as Email',
    (tester) async {
      const users = [
        UserModel(id: 1, name: 'Nikhil', email: 'nikhil@gmail.com'),
        UserModel(id: 2, name: 'Sanket', email: 'sanket@gmail.com'),
      ];
      Future<List<UserModel>> mockFetchUsers() async {
        await Future.delayed(const Duration(seconds: 1));
        return users;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: UserScreen(
            fetchUsers: mockFetchUsers(),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(users.length));
      for (final user in users) {
        expect(find.text(user.name), findsOneWidget);
        expect(find.text(user.email), findsOneWidget);
      }
    },
  );
}
