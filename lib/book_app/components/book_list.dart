import 'package:flutter/material.dart';
import 'package:flutter_web_projects/Theme/theme.dart';
import 'package:flutter_web_projects/book_app/components/navigate.dart';
import 'package:flutter_web_projects/book_app/models/category.dart';
import 'package:flutter_web_projects/book_app/views/HomePage/book_details.dart';
import 'package:uuid/uuid.dart';

class BookList extends StatelessWidget {
  final String? img;
  final String? title;
  final String? author;
  final String? date;
  final String? desc;
  final Entry? entry;

  BookList({
    Key? key,
    this.img,
    this.title,
    this.author,
    this.desc,
    this.entry,
    this.date,
  }) : super(key: key);

  static final uuid = Uuid();
  final String imgTag = uuid.v4();
  final String titleTag = uuid.v4();
  final String authorTag = uuid.v4();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigate.pushPage(
          context,
          BookDetails(
            entry: entry,
            imgTag: imgTag,
            titleTag: titleTag,
            authorTag: authorTag,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          height: 300,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                elevation: 4,
                child: Hero(
                  tag: imgTag,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    child: Container(
                      height: 300.0,
                      width: 200.0,
                      child: Image.network(
                        img!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Hero(
                        tag: titleTag,
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            title!,
                            style: const TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.w900,
                              // color: Theme.of(context).textTheme.title.color,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Hero(
                        tag: authorTag,
                        child: Material(
                          type: MaterialType.transparency,
                          child: Text(
                            author!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Constants.blueAccent,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                        width: 500.0,
                        child: Text(
                          '$desc'
                              .replaceAll(r'\n', '\n')
                              .replaceAll(r'\r', '')
                              .replaceAll(r'\"', '"'),
                          maxLines: 5,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Published $date',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
