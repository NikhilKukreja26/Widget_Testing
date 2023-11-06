import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_testing/home_page.dart';

void main() {
  testWidgets(
      'Given Counter is 0 When Increment Button Is Clicked Then Counter Should Be 1 ',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: MyHomePage(
          title: 'Counter App',
        ),
      ),
    );
    final counter = find.text('0');
    expect(counter, findsOneWidget);

    final counter2 = find.text('1');
    expect(counter2, findsNothing);

    // final incrementButton = find.byType(FloatingActionButton);
    final incrementButton = find.byKey(const Key('incrementCounter'));
    await tester.tap(incrementButton);

    await tester.pump();

    final counter3 = find.text('1');
    expect(counter3, findsOneWidget);

    final counter4 = find.text('0');
    expect(counter4, findsNothing);
  });
}
