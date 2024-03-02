import 'package:fast_food/Providers/HomePage_Provider.dart';
import 'package:fast_food/Providers/Login_Provider.dart';
import 'package:fast_food/Providers/SignUp_Provider.dart';
import 'package:fast_food/Widgets/Splash_Screen/Splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Login_Provider()),
          ChangeNotifierProvider(create: (_) => SignUp_Provider()),
          ChangeNotifierProvider(create: (_) => HomePage_Provider())
      ],
     child: MaterialApp(
       debugShowCheckedModeBanner: false,
       home: SplashScreen(),
     ),
    );
  }
}
