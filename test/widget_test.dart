import 'package:bluetooth_sample/src/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(BluetoothApp());

    expect(find.byType(ListView), findsOneWidget);
  });
}
