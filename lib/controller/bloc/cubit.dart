
import 'package:app_news/controller/bloc/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super (AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark=false;
  void changeAppThemeMode(){
    isDark=!isDark;
    emit(AppChangeAppThemeModeState());
  }
}