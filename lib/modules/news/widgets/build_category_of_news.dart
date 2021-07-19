import 'package:app_news/controller/method.dart';
import 'package:app_news/modules/news/bloc/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../show_more_news.dart';
import 'container_of_news.dart';
import '../../../widgets/build_listview_of_news.dart';

class BuildCategoryOfNews extends StatelessWidget {
  final String title;
  final List<dynamic> news;

  const BuildCategoryOfNews({@required this.title, @required this.news});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: SizedBox(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title.toUpperCase(),
                    style: Theme.of(context).textTheme.headline5),
                MaterialButton(
                  onPressed: () {
                    goToScreen(context: context,widget: ShowMoreNews(
                      title: title,news: news,
                    ));
                  },
                  child: Text(
                    "More",
                    style: TextStyle(
                        color: Colors.red[300],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            news.isEmpty?Center(child: CupertinoActivityIndicator())
                :Expanded(child: BuiltListViewOfNews(news: news,))  ,
          ],
        ),
      ),
    );
  }
}
