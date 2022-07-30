import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favorites.dart';
import 'package:testing_app/screens/home.dart';
import 'package:flutter_test/flutter_test.dart';

Widget createHomeScreen() => ChangeNotifierProvider(
      create: (context) => Favorites(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );

void main() {
  group("Home Page Widget Tests", () {
    testWidgets('Testing if ListView shows up', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.byType(ListView), findsOneWidget)
    });

    testWidgets('Testing Scrolling', (tester) async {
      await tester.pumpWidget(createHomeScreen());
      expect(find.text('Item 0'), findsOneWidget);
      await tester.fling(find.byType(ListView), Offset(0, -200), 3000);
      await tester.pumpAndSettle();
      expect(find.text('Item 0'), findsNothing);
    });
  });
}
