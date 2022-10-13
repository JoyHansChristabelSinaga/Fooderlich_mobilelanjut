import 'package:flutter/material.dart';
import 'package:fooderlich_prak3/models/models.dart';
import 'package:provider/provider.dart';
import 'fooderlich_theme.dart';
import 'home.dart';
import 'appDataProvider.dart';

void main() {
  // runApp(const Fooderlich());
  runApp(
      AppDataProvider(appData: AppData(isFavorite: true), child: Fooderlich()));
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();
    return MaterialApp(
      title: 'Fooderlich',
      theme: theme,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => TabManager(),
          ),
          ChangeNotifierProvider(
            create: (context) => GroceryManager(),
          ),
        ],
        child: const Home(),
      ),
    );
  }
}
