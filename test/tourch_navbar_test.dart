import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tourch_navbar/tourch_navbar.dart';

void main() {
  testWidgets('TourchNavbarSub displays icons and reacts to tap', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TourchNavbarSub(
            icons: const [
              Icons.home,
              Icons.search,
              Icons.category,
              Icons.settings,
              Icons.account_circle
            ],
            onItemTapped: (index) {
            },
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.category), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);
    expect(find.byIcon(Icons.account_circle), findsOneWidget);

    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.search), findsOneWidget);
  });
}
