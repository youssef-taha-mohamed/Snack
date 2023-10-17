import 'package:e_api/modules/business/business_screen.dart';
import 'package:e_api/modules/sciense/science_screen.dart';
import 'package:e_api/modules/seeting/setting_screen.dart';
import 'package:e_api/modules/sports/sports_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
   List<BottomNavigationBarItem> bottomItems = const [
     BottomNavigationBarItem(
         icon: Icon(
           Icons.business,
         ),
       label: 'Business'
     ),
     BottomNavigationBarItem(
         icon: Icon(
           Icons.sports,
         ),
       label: 'Sports'
     ),
     BottomNavigationBarItem(
         icon: Icon(
           Icons.science,
         ),
       label: 'Science'
     ),
     BottomNavigationBarItem(
         icon: Icon(
           Icons.settings,
         ),
       label: 'Settings'
     ),
   ];

   List<Widget> screen = const [
     BusinessScreen(),
     SportsScreen(),
     ScienceScreen(),
     SettingScreen()
   ];

   void changeBottomNavBar(int index){
     currentIndex = index;
     emit(NewsBottomNavState());
   }

}
