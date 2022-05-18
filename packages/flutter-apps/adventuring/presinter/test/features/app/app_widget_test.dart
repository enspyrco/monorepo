import 'package:flutter_test/flutter_test.dart';
import 'package:presinter/app/app_widget.dart';
import 'package:presinter/home/home_screen.dart';

void main() {
  testWidgets('App should load auth page when no signed in user detected',
      (tester) async {
    await tester.pumpWidget(const AppWidget());

    final homeFinder = find.byType(HomeScreen);
    final Finder = find.byType(HomeScreen);
  });
}
