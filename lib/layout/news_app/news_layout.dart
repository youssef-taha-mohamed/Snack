import 'package:e_api/layout/news_app/news_cubit.dart';
import 'package:e_api/network/remote/dio_hellper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: (){},
                    icon:const Icon(
                        Icons.search,
                    )),
              ],
              title: const Text(
                "News App",
              ),
            ),
            body: cubit.screen[cubit.currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                DioHelper.getData(
                    url: 'v2/top-headlines',
                    query: {
                      'country':'eg',
                      'category':'business',
                      'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'
                    }
                ).then((value) {
                  print(value.data.toString());
                }).catchError((e){
                  print(e.toString());
                });
              },
              child: Icon(
                Icons.add,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              items: cubit.bottomItems,
              onTap: (index){
                cubit.changeBottomNavBar(index);
              },
            ),
          );
        },
      ),
    );
  }
}
