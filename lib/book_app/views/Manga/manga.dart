import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_projects/Theme/theme.dart';
import 'package:flutter_web_projects/book_app/components/navigate.dart';
import 'package:flutter_web_projects/book_app/views/HomePage/book_details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Manga extends StatefulWidget {
  const Manga({Key? key}) : super(key: key);

  @override
  State<Manga> createState() => _MangaState();
}

class _MangaState extends State<Manga> {
  bool transition = false;

  startTimeout() {
    return Timer(const Duration(seconds: 5), handleTimeout);
  }

  void handleTimeout() {
    setState(() {
      transition = true;
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSwitcher(
            duration: const Duration(
              seconds: 1,
            ),
            child: transition
                ? SizedBox(
                    height: 31.5.h,
                    child: buildPreview(),
                  )
                : buildHeadingContainer(),
          ),
          SizedBox(height: 2.0.h),
          const ListTile(
            leading: Text(
              'Most Recent Anime & Manga Trends',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 22.0,
              ),
            ),
            trailing: Text(
              'View All',
              style: TextStyle(
                color: Colors.brown,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 39.5.h,
            child: buildPopularBooks(),
          ),
          SizedBox(height: 3.0.h),
          ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Trending Animes & Mangas of the Week',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 39.5.h,
            child: buildNewReleases(),
          ),
        ],
      ),
    );
  }

  buildHeadingContainer() {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 35.0.h,
            width: MediaQuery.of(context).size.width > 1200
                ? MediaQuery.of(context).size.width - 400
                : MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.orange.withOpacity(0.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Do you watch Anime & Mangas?',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Constants.blueAccent,
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(height: 1.0.h),
                  Text(
                    'Explore the Latest and Trending Animes & Mangas.\nWe will also provide you with the latest thrillers',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Constants.thickerAccent,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(height: 2.0.h),
                  SizedBox(
                    height: 5.0.h,
                    width: 20.0.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Constants.blueAccent,
                        ),
                      ),
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'Let\'s Explore Folks!.',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 1.5.h,
            right: 5.w,
            child: Image.asset(
              'assets/images/illustrator/reading.png',
              height: 35.h,
              width: 36.w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  buildPopularBooks() {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () => Navigate.pushPage(context, BookDetails()),
            child: Column(
              children: [
                Container(
                  height: 33.0.h,
                  width: MediaQuery.of(context).size.width > 1200
                      ? 14.0.w
                      : 17.0.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Constants.blueAccent,
                  ),
                ),
                Text(
                  'Attack on Titans',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Constants.blueAccent,
                    fontSize: 16.0,
                  ),
                ),
                const Text(
                  'Anime',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  buildNewReleases() {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Container(
                height: 30.0.h,
                width:
                    MediaQuery.of(context).size.width > 1200 ? 30.0.w : 30.0.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Constants.blueAccent,
                ),
              ),
              Text(
                'Dragon Ball Z',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Constants.blueAccent,
                  fontSize: 16.0,
                ),
              ),
              const Text(
                'Anime',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  buildPreview() {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 30.0.h,
            width: MediaQuery.of(context).size.width > 1200 ? 35.0.w : 35.0.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.orange,
            ),
          ),
        );
      },
    );
  }
}
