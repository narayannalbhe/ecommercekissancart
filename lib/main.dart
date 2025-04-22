import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Splash/SplashScreen.dart';
import 'package:untitled/provider/CountProvider.dart';
import 'package:untitled/provider/SliderProvider.dart';
import 'package:untitled/screens/CountExample.dart';
import 'package:untitled/screens/SliderExample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SliderProvider(),),
        ChangeNotifierProvider(create: (_) => CountProvider(),),
      ],

      child: const MaterialApp(
        title: 'Flutter Demo',
        home:  SliderExample(),
      ),
    );
  }
}

