import 'package:flutter/cupertino.dart';

import '../modules/news/widgets/container_of_news.dart';

class BuiltListViewOfNews extends StatelessWidget {
final List<dynamic>news;
final Axis scrollDirection;
  const BuiltListViewOfNews({@required this.news,this.scrollDirection:Axis.horizontal}) ;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),
        scrollDirection: scrollDirection,
        itemBuilder: (context, index) {
          return ContainerOfNews(
            url: news[index]['url'],
            urlToImage: news[index]['urlToImage'],
            title: news[index]['title'],
            widthOfContainer:scrollDirection==Axis.vertical?MediaQuery.of(context).size.width
            :300,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 20,
            width: 20,
          );
        },
        itemCount:news.length);
  }
}
