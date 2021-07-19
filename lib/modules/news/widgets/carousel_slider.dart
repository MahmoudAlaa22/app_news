import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'container_of_news.dart';

Widget carouselSliderWidget(List<dynamic> news) {
  return Padding(
    padding: EdgeInsets.only(top: 20),
    child: news.isEmpty
        ? Center(child: CupertinoActivityIndicator())
        : CarouselSlider(
            items: news.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return ContainerOfNews(
                    url: i['url'],
                    urlToImage: i['urlToImage'],
                    title: i['title'],
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 200,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            )),
  );
}
