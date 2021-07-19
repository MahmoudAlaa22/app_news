
import 'dart:developer';

import 'package:app_news/controller/api/dio_helper.dart';
import 'package:app_news/model/news_categories.dart';
import 'package:app_news/modules/news/bloc/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit():super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  List<dynamic> business = [];
  getBusiness()async{
   if(business.length==0){
     emit(NewsGetBusinessLoadingState());
     DioHelper.getData(category: NewsCategories.business)
         .then((value) {
       business=value.data['articles'];
       emit(NewsGetBusinessSuccessState());
     }).catchError((onError){
       log('Error in NewsGetBusinessState is ${onError.toString()}');
       emit(NewsGetBusinessErrorState(onError));
     });
   }
   else{
     emit(NewsGetBusinessSuccessState());
   }
  }
  List<dynamic> general = [];
  getGeneral()async{
    emit(NewsGetGeneralLoadingState());
    if(general.length==0){
      DioHelper.getData(category: NewsCategories.business)
          .then((value) {
        general=value.data['articles'];
        print("general is ${general[0]['title']}");
        emit(NewsGetGeneralSuccessState());
      }).catchError((onError){
        log('Error in NewsGetBusinessState is ${onError.toString()}');
        emit(NewsGetGeneralErrorState(onError));
      });
    }
    else{
      emit(NewsGetGeneralSuccessState());
    }
  }

  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());

    if(sports.length == 0)
    {
      DioHelper.getData(category: NewsCategories.sports)

          .then((value)
      {
        //print(value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else
    {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());

    if(science.length == 0)
    {
      DioHelper.getData(category: NewsCategories.science)
          .then((value)
      {
        //print(value.data['articles'][0]['title']);
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else
    {
      emit(NewsGetScienceSuccessState());
    }
  }

  List<dynamic> health = [];
  void getHealth()
  {
    emit(NewsGetHealthLoadingState());

    if(health.length == 0)
    {
      DioHelper.getData(category: NewsCategories.health)
          .then((value)
      {
        //print(value.data['articles'][0]['title']);
        health = value.data['articles'];


        emit(NewsGetHealthSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetHealthErrorState(error.toString()));
      });
    } else
    {
      emit(NewsGetHealthSuccessState());
    }
  }
  List<dynamic> technology = [];
  void getTechnology()
  {
    emit(NewsGetTechnologyLoadingState());

    if(technology.length == 0)
    {
      DioHelper.getData(category: NewsCategories.technology)
          .then((value)
      {
        //print(value.data['articles'][0]['title']);
        technology = value.data['articles'];


        emit(NewsGetTechnologySuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetTechnologyErrorState(error.toString()));
      });
    } else
    {
      emit(NewsGetTechnologySuccessState());
    }
  }

 List<dynamic> entertainment = [];
  void getEntertainment()
  {
    emit(NewsGetEntertainmentLoadingState());

    if(entertainment.length == 0)
    {
      DioHelper.getData(category: NewsCategories.entertainment)
          .then((value)
      {
        //print(value.data['articles'][0]['title']);
        entertainment = value.data['articles'];


        emit(NewsGetEntertainmentSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(NewsGetEntertainmentErrorState(error.toString()));
      });
    } else
    {
      emit(NewsGetEntertainmentSuccessState());
    }
  }

  List<dynamic> search = [];
  void getSearch({@required String searchValue})
  {
    emit(NewsGetSearchLoadingState());
      DioHelper.getDataOfSearch(value: searchValue)
          .then((value)
      {
        search =  value.data['articles'];
        print("search is $search");
        emit(NewsGetSearchSuccessState());
      }).catchError((error){
        search=[];
        print("error.toString() ${error.toString()}");
        emit(NewsGetSearchErrorState(error.toString()));
      });

  }
}