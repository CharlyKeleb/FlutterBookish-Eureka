import 'package:flutter/material.dart';
import 'package:flutter_web_projects/Theme/theme.dart';
import 'package:flutter_web_projects/book_app/components/navigate.dart';
import 'package:flutter_web_projects/book_app/views/HomePage/book_details.dart';
import 'package:flutter_web_projects/book_app/views/HomePage/category/category_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeadingContainer(),
          SizedBox(height: 2.0.h),
          const ListTile(
            leading: Text(
              'Popular Now',
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
                  'Book Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'Click to explore different book categories',
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          buildCategories(),
          SizedBox(height: 3.0.h),
          ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'New Releases',
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
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Build your reading library',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Constants.blueAccent,
                      fontSize: 25.0,
                    ),
                  ),
                  SizedBox(height: 1.0.h),
                  Text(
                    'Read your favorite book for free.\nWe will also provide you with your favorite Anime and Manga Characters.',
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
                          'Have fun Exploring',
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
                  'The Most Dangerous Game',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Constants.blueAccent,
                    fontSize: 16.0,
                  ),
                ),
                const Text(
                  'Arthur Conan Doyle',
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

  buildCategories() {
    return SizedBox(
      height: 6.0.h,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                onTap: () => Navigate.pushPage(
                  context,
                  const CategoryScreen(),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'Short Stories',
                      style: TextStyle(
                        color: Colors.white,
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
                height: 33.0.h,
                width:
                    MediaQuery.of(context).size.width > 1200 ? 14.0.w : 17.0.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Constants.blueAccent,
                ),
              ),
              Text(
                'The Blazing World',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Constants.blueAccent,
                  fontSize: 16.0,
                ),
              ),
              const Text(
                'Margaret Cavendish',
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
}
