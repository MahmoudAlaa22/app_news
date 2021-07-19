import 'package:app_news/controller/method.dart';
import 'package:app_news/modules/web_view/web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerOfNews extends StatelessWidget {
final String urlToImage;
final String title;
final double widthOfContainer;
final String url;
  const ContainerOfNews({@required this.url,this.widthOfContainer,@required this.urlToImage, @required this.title}) ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        goToScreen(widget: WebViewPage(url: url),context: context);
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all()
            ),
            height: 250,
            width:widthOfContainer ,
            child: urlToImage!=null?Image.network(
              urlToImage,
              fit: BoxFit.fill,
            ):Row(),
          ),
          Container(
              height: 100,
              width: widthOfContainer,
              decoration: BoxDecoration(
                color: Colors.black54,
              ),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )),
        ],
      ),
    );
  }
}
