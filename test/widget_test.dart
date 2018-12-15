import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart';

void main() {
  testWidgets('Base test', (WidgetTester tester) async {
    await tester.pumpWidget(MainApp());
    expect(find.text('internStack'), findsOneWidget);
  });
}
