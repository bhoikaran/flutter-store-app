import 'package:flutter/material.dart';
import 'package:store_app/counter/counter.dart';
import 'package:store_app/l10n/l10n.dart';
import 'package:store_app/product_store/views/homeview.dart';
import 'package:store_app/themes/styles.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: Styles.lightScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: Styles.darkScheme,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomeView(),
    );
  }
}
