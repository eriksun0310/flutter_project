import 'package:expense_tracker/widget/expenses.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, //將顏色方案設置為暗色主題
    seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() {
  //以確保在設置方向之前，Flutter 環境已經準備好
  // WidgetsFlutterBinding.ensureInitialized();
  // 表示應用程序將僅在豎屏模式下運行
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  //     .then((fn) {
  // });
   runApp(MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
            colorScheme: kDarkColorScheme,
            cardTheme: const CardTheme().copyWith(
                color: kDarkColorScheme.secondaryContainer,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kDarkColorScheme.primaryContainer,
                    foregroundColor: kDarkColorScheme.onPrimaryContainer))),
        // copyWith():修改特定的屬性,而不會影響原始的對象,方便的客製化樣式屬性
        theme: ThemeData().copyWith(
            colorScheme: kColorScheme,
            appBarTheme: const AppBarTheme().copyWith(
                backgroundColor: kColorScheme.onPrimaryContainer,
                foregroundColor: kColorScheme.primaryContainer),
            cardTheme: const CardTheme().copyWith(
                color: kColorScheme.secondaryContainer,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kColorScheme.primaryContainer)),
            textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kColorScheme.onSecondaryContainer,
                    fontSize: 16))),
        // 可以強制應用程式始終在dark、light
        // themeMode: ThemeMode.system,//default
        home: const Expenses()));
}
