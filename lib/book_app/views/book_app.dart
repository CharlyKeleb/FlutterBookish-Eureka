import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_point_tab_bar/pointTabIndicator.dart';
import 'package:flutter_web_projects/book_app/view_models/app/theme_provider.dart';
import 'package:flutter_web_projects/book_app/views/Books/home.dart';
import 'package:flutter_web_projects/book_app/views/Manga/manga.dart';
import 'package:flutter_web_projects/book_app/views/superheroes/superhero.dart';
import 'package:flutter_web_projects/utils/extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Bookish-Eureka').fadeInList(0, true),
        actions: [
          Consumer<AppProvider>(
            builder: (context, notifier, child) => GestureDetector(
              onTap: () {
                notifier.toggleTheme();
              },
              child: notifier.dark
                  ? const Icon(CupertinoIcons.sun_min_fill)
                  : const Icon(CupertinoIcons.moon_stars_fill),
            ),
          ),
          const SizedBox(width: 40.0)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
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
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'Home',
                      style: GoogleFonts.nunito(
                        fontSize: 15.0,
                      ),
                    ),
                  ).fadeInList(1, true),
                  Tab(
                    child: Text(
                      'SuperHeroes',
                      style: GoogleFonts.nunito(
                        fontSize: 15.0,
                      ),
                    ),
                  ).fadeInList(2, true),
                  Tab(
                    child: Text(
                      'Mangas & Animes',
                      style: GoogleFonts.nunito(
                        fontSize: 15.0,
                      ),
                    ),
                  ).fadeInList(3, true),
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
                  Manga(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
