import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
final String url;
const WebViewPage({@required this.url});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(url,maxLines: 1,overflow: TextOverflow.ellipsis,),),
      body: WebView(
          initialUrl: url,
        onPageStarted: (v){
            print("onPageStarted is $v");
        },
        onPageFinished: (v){
          print("onPageFinished is $v");
        },
        onWebResourceError: (v){
            print('v is $v');
        },
      ),
    );
  }
}
