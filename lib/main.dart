import 'package:flutter/material.dart';
import 'package:insights_news/core/app_colors.dart';
import 'package:insights_news/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  color: AppColors.lomanda,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              backgroundColor: AppColors.sacffoldBG,
              elevation: 0.0),
          iconTheme: IconThemeData(color: AppColors.grey),
          scaffoldBackgroundColor: AppColors.sacffoldBG,
          inputDecorationTheme: InputDecorationTheme(
            suffixIconColor: AppColors.lomanda,
            labelStyle: TextStyle(color: AppColors.grey),
            prefixIconColor: AppColors.lomanda,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          )),
      home: const SplashView(),
    );
  }
}
