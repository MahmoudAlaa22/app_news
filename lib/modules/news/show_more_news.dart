import 'package:app_news/widgets/build_listview_of_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowMoreNews extends StatelessWidget {
final String title;
final List<dynamic>news;
  const ShowMoreNews({@required this.title,@required this.news}) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title.toUpperCase()),),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BuiltListViewOfNews(news: news,scrollDirection: Axis.vertical),
      ),
    );
  }
}
