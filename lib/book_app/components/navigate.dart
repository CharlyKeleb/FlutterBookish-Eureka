import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigate {
  static Future pushPage(BuildContext context, Widget page, {String name = ''}) {
    var val = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
        settings: RouteSettings(name: '$name'),
      ),
    );
    return val;
  }

  static Future pushPageDialog(BuildContext context, Widget page, {String name = ''}) {
    var val = Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
        fullscreenDialog: true,
        settings: RouteSettings(name: '$name'),
      ),
    );

    return val;
  }

  static pushPageReplacement(BuildContext context, Widget page, {String name = ''}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
        settings: RouteSettings(name: '$name'),
      ),
    );
  }
}
