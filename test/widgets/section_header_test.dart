import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onefi_assignment_application/widgets/common/section_header.dart';

void main() {
  group('SectionHeader Widget Tests', () {
    testWidgets('Renders header title in uppercase with tick bar', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SectionHeader(title: 'offers'),
          ),
        ),
      );

      // Verify uppercase title rendering
      expect(find.text('OFFERS'), findsOneWidget);

      // Verify row and container tick bar present
      expect(find.byType(SectionHeader), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
    });
  });
}
