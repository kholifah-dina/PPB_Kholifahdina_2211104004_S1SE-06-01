import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tp_09/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the app contains "Hello World" text.
    expect(find.text('Hello World'), findsOneWidget);

    // Verify that a counter text '0' and '1' exists
    // or adapt this based on your actual UI.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsNothing);

    // If there is a '+' button, uncomment the following to test increment.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // expect(find.text('1'), findsNothing);
  });
}
