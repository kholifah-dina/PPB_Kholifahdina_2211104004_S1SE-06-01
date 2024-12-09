import 'package:cobaa/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build aplikasi dan render frame pertama
    await tester.pumpWidget(MaterialApp(home: HomePage()));

    // Verifikasi bahwa counter dimulai dari 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tekan ikon "+" dan render frame berikutnya
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verifikasi bahwa counter telah bertambah
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);

    // Tekan ikon "refresh" dan render frame berikutnya
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    // Verifikasi bahwa counter telah direset ke 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);
  });
}
