import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Home/HomeView/HomeScreen.dart';
import 'package:untitled/Splash/SplashScreen.dart';
import 'package:untitled/bloc/LoginPage.dart';
import 'package:untitled/bloc/login_bloc.dart';
import 'package:untitled/provider/CountProvider.dart';
import 'package:untitled/provider/SliderProvider.dart';
import 'package:untitled/screens/CountExample.dart';
import 'package:untitled/screens/SliderExample.dart';

import 'auth/auth_view/login/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
          child: MaterialApp(
            title: 'BLoC Demo',
            theme: ThemeData(primarySwatch: Colors.blue),
            home:  LoginPage(),
            routes: {
              '/home': (context) => const HomeScreen(),
              '/login': (context) => LoginPage(),

            },
          ),
        );
  }

// Widget build(BuildContext context) {
  //
  //   return MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (_) => SliderProvider(),),
  //       ChangeNotifierProvider(create: (_) => CountProvider(),),
  //     ],
  //
  //     child: const MaterialApp(
  //       title: 'Flutter Demo',
  //       home:  SliderExample(),
  //     ),
  //   );
  // }
}

