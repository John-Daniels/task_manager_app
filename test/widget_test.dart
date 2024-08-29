import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/main.dart';

void main() {
  testWidgets('Splash Screen Launches', (WidgetTester tester) async {
    // Pump the widget into the widget tree
    await tester.pumpWidget(const MyApp());

    // Verify the splash screen is displayed with the correct text
    expect(find.text('T . M'), findsOneWidget);

    // Simulate the passing of time to handle any asynchronous operations in the splash screen
    await tester.pump(const Duration(seconds: 4));

    // Optionally, verify splash screen transition (based on your app's behavior after 3 seconds)
    // For example, checking if another screen appears after the splash screen
    expect(find.text("Log In"), findsOneWidget);
  });
}
