import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_web_projects/Theme/theme.dart';
import 'package:flutter_web_projects/book_app/components/body_builder.dart';
import 'package:flutter_web_projects/book_app/components/navigate.dart';
import 'package:flutter_web_projects/book_app/models/category.dart';
import 'package:flutter_web_projects/book_app/view_models/books/category_view_model.dart';
import 'package:flutter_web_projects/book_app/views/HomePage/book_details.dart';
import 'package:flutter_web_projects/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class CategoryScreen extends StatefulWidget {
  final String? title;
  final String? url;

  const CategoryScreen({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => Provider.of<CategoryProvider>(context, listen: false)
          .getFeed(widget.url!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder:
          (BuildContext context, CategoryProvider provider, Widget? child) {
        return Scaffold(
          appBar: AppBar(),
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal:
                  MediaQuery.of(context).size.width > 1200 ? 320.0 : 40.0,
            ),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title!,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Explore ${widget.title} Category',
                  style: const TextStyle(),
                ),
                Flexible(
                  child: BodyBuilder(
                    apiRequestStatus: provider.apiRequestStatus,
                    reload: () => provider.getFeed(widget.url!),
                    child: GridView.builder(
                      controller: provider.controller,
                      itemCount: provider.items.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.8 / 2.3,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final String imgTag = uuid.v4();
                        final String titleTag = uuid.v4();
                        final String authorTag = uuid.v4();
                        Entry entry = provider.items[index];
                        return Column(
                          children: [
                            InkWell(
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
                              child: SizedBox(
                                height: MediaQuery.of(context).size.width > 1200
                                    ? 36.h
                                    : 35.0.h,
                                width: MediaQuery.of(context).size.width > 1200
                                    ? 19.0.w
                                    : 22.0.w,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 5,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    child: Hero(
                                      tag: imgTag,
                                      child: Container(
                                        height: 50.h,
                                        width: 20.w,
                                        child: Image.network(
                                          entry.link![1].href!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Hero(
                              tag: titleTag,
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  entry.title!.t!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            Hero(
                              tag: authorTag,
                              child: Material(
                                type: MaterialType.transparency,
                                child: Text(
                                  entry.author!.name!.t!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Constants.blueAccent,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width > 1200
                                  ? 19.0.w
                                  : 22.0.w,
                              child: Text(
                                entry.summary!.t!,
                                maxLines: 5,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
