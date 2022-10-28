import 'package:flutter/material.dart';
import 'package:flutter_web_projects/Theme/theme.dart';

class DescriptionWidget extends StatefulWidget {
  final String? text;

  DescriptionWidget({@required this.text});

  @override
  _DescriptionWidgetState createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  String? firstHalf;
  String? secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text!.length > 300) {
      firstHalf = widget.text!.substring(0, 300);
      secondHalf = widget.text!.substring(300, widget.text!.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf!.isEmpty
          ? Text(
              '${flag ? (firstHalf) : (firstHalf! + secondHalf!)}'
                  .replaceAll(r'\n', '\n')
                  .replaceAll(r'\r', '')
                  .replaceAll(r"\'", "'").replaceAll('\'', ''),
              style:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  (flag ? (firstHalf! + '...') : (firstHalf! + secondHalf!))
                      .replaceAll(r'\n', '\n\n')
                      .replaceAll(r'\r', '')
                      .replaceAll(r"\'", "'"),
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        flag ? 'show more' : 'show less',
                        style: TextStyle(color: Constants.blueAccent),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
