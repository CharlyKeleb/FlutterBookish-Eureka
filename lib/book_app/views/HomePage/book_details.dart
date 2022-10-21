import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_projects/Theme/theme.dart';
import 'package:flutter_web_projects/book_app/components/book_list.dart';
import 'package:flutter_web_projects/book_app/components/text_description.dart';
import 'package:sizer/sizer.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({
    Key? key,
  });

  @override
  _BookDetailsState createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_backspace),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {},
            icon: const Icon(CupertinoIcons.heart_fill, color: Colors.red),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.share,
            ),
          ),
          const SizedBox(
            width: 320.0,
          )
        ],
      ),
      body: _buildBody(context),
    );
  }
}

_buildBody(BuildContext context) {
  return ListView(
    padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 1200 ? 320.0 : 40.0,
        vertical: 10.0),
    children: [
      _buildImageTitle(context),
      const SizedBox(height: 5.0),
      const Divider(thickness: 2.0),
      const Text(
        'Description',
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23.0),
      ),
      const SizedBox(height: 5.0),
      DescriptionWidget(
        text:
            'A few resources to get you started if this is your first Flutter project. For help getting started with Flutter development, view the online documentation',
      ),
      const SizedBox(height: 10.0),
      _buildDownloadReadButton(context),
      const SizedBox(height: 15.0),
      const Text(
        'More from Author',
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23.0),
      ),
      const Divider(thickness: 2.0),
      _buildMoreBookFromAuthor(),
    ],
  );
}

_buildImageTitle(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 50.h,
        width: MediaQuery.of(context).size.width,
        child: Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  height: 50.h,
                  width: 20.w,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 5),
              Align(
                alignment: Alignment.bottomCenter,
                child: _buildCategory(context),
              )
            ],
          ),
        ),
      ),
      const SizedBox(height: 10.0),
      const Material(
        type: MaterialType.transparency,
        child: Text(
          'Devil May Cry',
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      const SizedBox(height: 5.0),
      Material(
        type: MaterialType.transparency,
        child: Text(
          'This is a new book in the market',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Constants.blueAccent,
          ),
        ),
      ),
    ],
  );
}

_buildCategory(BuildContext context) {
  return Container(
    height: 70,
    width: 150,
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 210 / 80,
      ),
      itemBuilder: (BuildContext context, int index) {
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
                      color: Constants.blueAccent,
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
                    'comedy',
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                      color: Constants.blueAccent,
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

_buildDownloadReadButton(BuildContext context) {
  return Container(
    height: 50.0,
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          Constants.blueAccent,
        ),
      ),
      onPressed: () {},
      child: const Center(
        child: Text(
          'Read Now',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    ),
  );
}

_buildMoreBookFromAuthor() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 5,
    itemBuilder: (BuildContext context, int index) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: BookList(),
      );
    },
  );
}
