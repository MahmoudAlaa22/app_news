import 'package:app_news/controller/bloc/cubit.dart';
import 'package:app_news/modules/news/bloc/cubit.dart';
import 'package:app_news/modules/news/bloc/states.dart';
import 'package:app_news/widgets/build_listview_of_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(blurRadius: 5,offset: Offset(2,3))]
                  ),
                  child: TextFormField(
                    autofocus: true,
                    style: TextStyle(
                      fontSize: 25
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Searching here...'
                    ),
                    onChanged: (String value){
                      NewsCubit.get(context).getSearch(value: value);
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(child: BuiltListViewOfNews(news: NewsCubit.get(context).search,scrollDirection: Axis.vertical,))
              ],
            ),
          ),
        );
      },
      listener: (context,state){},
    );
  }
}
