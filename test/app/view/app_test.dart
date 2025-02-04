// import 'package:flutter_test/flutter_test.dart';
// import 'package:store_app/app/app.dart';
// import 'package:store_app/counter/counter.dart';

// void main() {
//   group('App', () {
//     testWidgets('renders CounterPage', (tester) async {
//       await tester.pumpWidget(const App());
//       expect(find.byType(CounterPage), findsOneWidget);
//     });
//   });
// }

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:store_app/app/view/app.dart';
import 'package:store_app/counter/view/counter_page.dart';
import 'package:store_app/product_store/model/app_state_model.dart';
import 'package:store_app/product_store/views/homeview.dart';

void main() {
  // testWidgets('renders CounterPage', (WidgetTester tester) async {
  //   await tester.pumpWidget(
  //     MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider<AppStateModel>(
  //           create: (context) => AppStateModel(),
  //         ),
  //       ],
  //       child: const MaterialApp(home: HomeView()),
  //     ),
  //   );

  //   // Ensure that CounterPage is present
  //   // expect(find.byType(CounterPage), findsOneWidget);

  //   await tester.tap(find.byIcon(Icons.add)); // Example: simulate tap
  //   await tester.pumpAndSettle(); // Wait for animations/navigation

  //   expect(find.byType(CounterPage), findsOneWidget);
  // });
}
