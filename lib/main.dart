import 'package:bloc/bloc.dart';
import 'package:e_api/layout/news_app/news_layout.dart';
import 'package:e_api/network/remote/dio_hellper.dart';
import 'package:e_api/shared/styles/bloc_observice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        floatingActionButtonTheme:const FloatingActionButtonThemeData(
          backgroundColor: Colors.deepOrange,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
         // backwardsCompatibility: false,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0.0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ),
        bottomNavigationBarTheme:const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
          elevation: 20.0
        ),
        primarySwatch: Colors.deepOrange,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black12,
      ),
      themeMode: ThemeMode.light,
      home: const NewsLayout(),
    );
  }
}
