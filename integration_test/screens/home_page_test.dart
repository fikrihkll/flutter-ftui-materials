import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/screens/home_page.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Input number 2 then press Button 2 times and input 6 then press once, should show 4 and 10', (WidgetTester tester) async {
    // Create HomePage
    await tester.pumpWidget(
        MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(),
          home: const HomePage(),
        )
    );

    // Find TextField with the key "textfield_number" and Type number 2
    await tester.enterText(
        find.byKey(const Key("textfield_number")),
        "2"
    );

    // Find any widget text Add Number then tap the widget
    await tester.tap(find.text("Add Number"));
    await tester.tap(find.text("Add Number"));
    await tester.pump();

    // Query one widget with the key "text_added_number" then store it in a variable
    Text text = tester.firstWidget(find.byKey(const Key("text_added_number")));
    // Expect the text data is 4
    expect(text.data, "4");

    // Find TextField with the key "textfield_number" and Type number 6
    await tester.enterText(
        find.byKey(const Key("textfield_number")),
        "6"
    );

    // Find any widget text Add Number then tap the widget
    await tester.tap(find.text("Add Number"));
    await tester.pump();

    // Query one widget with the key "text_added_number" then store it in a variable
    text = tester.firstWidget(find.byKey(const Key("text_added_number")));
    // Expect the text data is 10
    expect(text.data, "10");
  });

}