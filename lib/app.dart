import 'package:currency/common/common.dart';
import 'package:currency/presentation/presentation.dart';
import 'package:flutter/material.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const HomePage(),
      scaffoldMessengerKey: AppSnackbar.scaffoldMessengerKey,
    );
  }
}
