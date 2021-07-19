import 'package:app_news/controller/bloc/cubit.dart';
import 'package:app_news/controller/method.dart';
import 'package:app_news/model/news_categories.dart';
import 'package:app_news/modules/news/bloc/cubit.dart';
import 'package:app_news/modules/news/bloc/states.dart';
import 'package:app_news/modules/news/search_screen.dart';
import 'package:app_news/modules/news/widgets/build_category_of_news.dart';
import 'package:app_news/modules/news/widgets/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var newsCubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('News'),
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.search,
                    ),
                    onPressed: () {
                      NewsCubit.get(context).search=[];
                      goToScreen(context: context, widget: SearchScreen());
                    }),
                IconButton(
                    icon: Icon(Icons.brightness_4_outlined),
                    onPressed: () {
                      AppCubit.get(context).changeAppThemeMode();
                    }),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  carouselSliderWidget(newsCubit.general),
                  SizedBox(
                    height: 25,
                  ),
                  BuildCategoryOfNews(
                    title: NewsCategories.business,
                    news: newsCubit.business,
                  ),
                  BuildCategoryOfNews(
                    title: NewsCategories.sports,
                    news: newsCubit.sports,
                  ),
                  BuildCategoryOfNews(
                      title: NewsCategories.health, news: newsCubit.health),
                  BuildCategoryOfNews(
                      title: NewsCategories.science, news: newsCubit.science),
                  BuildCategoryOfNews(
                      title: NewsCategories.technology,
                      news: newsCubit.technology),
                  BuildCategoryOfNews(
                      title: NewsCategories.entertainment,
                      news: newsCubit.entertainment),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
