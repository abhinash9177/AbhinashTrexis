import 'package:abhinash_trexis/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Abhinas Trexis UI Testing.', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('User Name'), findsOneWidget);

    final textField = find.byKey(const Key('username'));

    await tester.enterText(textField, 'New Name');

    final passField = find.byKey(const Key('password'));

    await tester.enterText(passField, 'Mypass');

    expect(find.text('Mypass'), findsOneWidget);

    await tester.tap(find.text('Login'));

    await tester.pump();

    expect(find.text('Home'), findsOneWidget);

    await tester.tap(find.text('Services'));

    await tester.pump();

    await tester.tap(find.text('Contacts'));
  });
}
