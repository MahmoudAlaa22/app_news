import 'package:app_news/controller/bloc/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/api/dio_helper.dart';
import 'controller/bloc/states.dart';
import 'controller/bloc_observer.dart';
import 'controller/themes/theme_mode_dark.dart';
import 'controller/themes/theme_mode_light.dart';
import 'modules/news/bloc/cubit.dart';
import 'modules/news/home.dart';

void main() {
  // بيتأكد ان كل حاجه هنا في الميثود خلصت و بعدين يتفح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context)=>AppCubit(),),
      BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getGeneral()..getHealth()
        ..getScience()..getSports()..getTechnology()..getEntertainment()
        ,),
    ],
        child:BlocConsumer<AppCubit,AppStates>(
          builder: (context,state){
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'News',
                theme: themeDataLightMode(),
                darkTheme: themeDataDarkMode(),
                themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
                home: Home()
            );
          },
          listener: (context,state){},
        )
    );
  }
}
