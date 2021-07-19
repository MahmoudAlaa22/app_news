

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void goToScreen({@required BuildContext context,@required Widget widget}){
  Navigator.of(context).push(
      CupertinoPageRoute(builder: (_)=> widget)
  );
}