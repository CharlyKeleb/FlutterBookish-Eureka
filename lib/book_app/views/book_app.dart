import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';
import 'package:flutter_web_projects/Theme/theme.dart';
import 'package:flutter_web_projects/book_app/views/Anime/anime.dart';
import 'package:flutter_web_projects/book_app/views/HomePage/home.dart';
import 'package:flutter_web_projects/book_app/views/Manga/manga.dart';
import 'package:flutter_web_projects/book_app/views/superheroes/superhero.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class BookApp extends StatefulWidget {
  const BookApp({Key? key}) : super(key: key);

  @override
  State<BookApp> createState() => _BookAppState();
}

class _BookAppState extends State<BookApp> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(height: 1.0.h),
            _buildHeader(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: TabBar(
                controller: _tabController,
                labelPadding: const EdgeInsets.symmetric(horizontal: 25),
                labelStyle: GoogleFonts.nunito(fontWeight: FontWeight.bold),
                unselectedLabelStyle:
                    GoogleFonts.nunito(fontWeight: FontWeight.bold),
                indicatorColor: const Color(0xfff3f4f9),
                indicator: PointTabIndicator(
                  position: PointTabIndicatorPosition.bottom,
                  insets: const EdgeInsets.only(bottom: 3),
                  color: Theme.of(context).colorScheme.secondary,
                ),
                indicatorWeight: 1.0,
                isScrollable: true,
                unselectedLabelColor: Colors.grey,
                tabs: const <Widget>[
                  Tab(
                    child: Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'SuperHeroes',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Mangas & Animes',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: const <Widget>[
                  Home(),
                  Superheroes(),
                  // Anime(),
                  Manga(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width > 1200 ? 200 : 0,
      ),
      child: ListTile(
        leading: Text(
          getText(),
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 22.0),
        ),
        title: Container(
          height: 4.5.h,
          width: MediaQuery.of(context).size.width - 40.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                blurRadius: 60.0,
                spreadRadius: 0.0,
                offset: const Offset(0.0, 16.0),
                color: const Color(0xff4E4F72).withOpacity(0.08),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: TextField(
              textAlign: TextAlign.left,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintStyle: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                hintText: 'Search',
                border: InputBorder.none,
                // suffixIcon: Icon(
                //   Iconsax.search_normal,
                //   color: Constants.blueAccent,
                // ),
              ),
              onChanged: (query) {},
            ),
          ),
        ),
        trailing: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10.0,
          children: [
            const Icon(CupertinoIcons.heart_fill, color: Colors.red),
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: const Center(
                child: Text(
                  'C',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22.0),
                ),
              ),
            ),
            const Text(
              'EN',
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
    );
  }

  getText() {
    switch (_tabController!.index) {
      case 0:
        return "Flutter Books";
      case 1:
        return "Flutter Superhero";
      case 2:
        return "Flutter Mangas/Anime";
    }
  }
}
