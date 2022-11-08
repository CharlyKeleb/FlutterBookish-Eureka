import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_web_projects/Theme/theme.dart';
import 'package:flutter_web_projects/book_app/components/book_list.dart';
import 'package:flutter_web_projects/book_app/components/loading_indicator.dart';
import 'package:flutter_web_projects/book_app/components/navigate.dart';
import 'package:flutter_web_projects/book_app/components/text_description.dart';
import 'package:flutter_web_projects/book_app/models/category.dart';
import 'package:flutter_web_projects/book_app/view_models/books/book_details_view_model.dart';
import 'package:flutter_web_projects/book_app/views/Books/read_book.dart';
import 'package:internet_file/internet_file.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class BookDetails extends StatefulWidget {
  final Entry? entry;
  final String? imgTag;
  final String? titleTag;
  final String? authorTag;

  const BookDetails({
    Key? key,
    required this.entry,
    required this.imgTag,
    required this.titleTag,
    required this.authorTag,
  }) : super(key: key);

  @override
  BookDetailsState createState() => BookDetailsState();
}

class BookDetailsState extends State<BookDetails> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
          (_) {
        Provider.of<DetailsProvider>(context, listen: false)
            .setEntry(widget.entry);
        Provider.of<DetailsProvider>(context, listen: false).getFeed(
            widget.entry!.author!.uri!.t!.replaceAll(r'\&lang=en', ''));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsProvider>(builder:
        (BuildContext context, DetailsProvider viewModel, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.keyboard_backspace),
          ),
        ),
        body: _buildBody(viewModel, context),
      );
    });
  }

  _buildBody(DetailsProvider viewModel, BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery
            .of(context)
            .size
            .width > 1200 ? 320.0 : 40.0,
        vertical: 10.0,
      ),
      children: [
        _buildImageTitle(viewModel, context),
        const SizedBox(height: 5.0),
        const Divider(thickness: 2.0),
        const Text(
          'Description',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23.0),
        ),
        const SizedBox(height: 5.0),
        DescriptionWidget(
          text: '${widget.entry!.summary!.t}',
        ),
        const SizedBox(height: 10.0),
        _buildReadButton(context),
        const SizedBox(height: 15.0),
        const Text(
          'More from Author',
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23.0),
        ),
        const Divider(thickness: 2.0),
        _buildMoreBookFromAuthor(viewModel),
      ],
    );
  }

  _buildImageTitle(DetailsProvider viewModel, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50.h,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Hero(
                    tag: widget.imgTag!,
                    child: Container(
                      height: 50.h,
                      width: 20.w,
                      child: Image.network(
                        widget.entry!.link![1].href!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildCategory(widget.entry!, context),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10.0),


        Hero(
          tag: widget.titleTag!,
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              widget.entry!.title!.t!.replaceAll(r'\', ''),
              style: const TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        Hero(
          tag: widget.authorTag!,
          child: Material(
            type: MaterialType.transparency,
            child: Text(
              '${widget.entry!.author!.name!.t}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.dark ? Constants.lightAccent : Constants.blueAccent,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _buildCategory(Entry entry, BuildContext context) {
    return Container(
      height: 70,
      width: 150,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: entry.category!.length > 4 ? 4 : entry.category!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 210 / 80,
        ),
        itemBuilder: (BuildContext context, int index) {
          Category cat = entry.category![index];
          return Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 5.0, 5.0),
            child: Container(
              height: 25.0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2.0),
                child: OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    side: MaterialStateProperty.all<BorderSide>(
                      BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark ? Constants.lightAccent : Constants.blueAccent,
                      ),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${cat.label}',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark ? Constants.lightAccent : Constants.blueAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _buildReadButton(BuildContext context) {
    return Container(
      height: 50.0,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Constants.blueAccent,
          ),
        ),
        onPressed: () async {
          setState(() {
            loading = true;
          });
          Uint8List url = await InternetFile.get(widget.entry!.link![3].href!);
          setState(() {
            loading = false;
          });
          Navigate.pushPage(
            context,
            BookReaderPage(
                epubUrl: url,
                bookTitle: widget.entry!.title!.t!.replaceAll(r'\', '')),
          );
        },
        child: loading
            ? loadingIndicator(context)
            : const Center(
          child: Text(
            'Read Book',
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }

  _buildMoreBookFromAuthor(DetailsProvider viewModel) {
    if (viewModel.loading) {
      return SizedBox(
        height: 100.0,
        child: loadingIndicator(context),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: viewModel.related.feed!.entry!.length,
        itemBuilder: (BuildContext context, int index) {
          Entry entry = viewModel.related.feed!.entry![index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: BookList(
              img: entry.link![1].href,
              title: entry.title!.t!,
              date: entry.published!.t!.split('T')[0].toString(),
              author: entry.author!.name!.t!,
              desc: entry.summary!.t!,
              entry: entry,
            ),
          );
        },
      );
    }
  }
}
