import 'package:flutter_test/flutter_test.dart';
import 'package:weather_nba_api_examples/main.dart';

void main() {
  testWidgets('loads API example tabs', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('API Examples'), findsOneWidget);
    expect(find.text('Weather API'), findsOneWidget);
    expect(find.text('Istanbul'), findsOneWidget);

    await tester.tap(find.text('NBA'));
    await tester.pumpAndSettle();

    expect(find.text('NBA API'), findsOneWidget);
    expect(find.text('Boston Celtics'), findsOneWidget);
  });
}
