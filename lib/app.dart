import 'package:currency/common/common.dart';
import 'package:currency/ui/presentation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => BitCoinProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Currency',
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          home: const HomePage(),
          scaffoldMessengerKey: AppSnackbar.scaffoldMessengerKey,
        ),
      );
    });
  }
}
