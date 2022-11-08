import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_web_projects/Theme/theme.dart';
import 'package:flutter_web_projects/book_app/components/error/error_widget.dart';
import 'package:flutter_web_projects/book_app/components/loading_indicator.dart';
import 'package:flutter_web_projects/book_app/components/navigate.dart';
import 'package:flutter_web_projects/book_app/view_models/animes/anime_view_model.dart';
import 'package:flutter_web_projects/book_app/view_models/animes/popular_anime_view_model.dart';
import 'package:flutter_web_projects/book_app/view_models/animes/trending_anime_view_model.dart';
import 'package:flutter_web_projects/book_app/views/Manga/manga_details.dart';
import 'package:flutter_web_projects/utils/extension.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Manga extends StatefulWidget {
  const Manga({Key? key}) : super(key: key);

  @override
  State<Manga> createState() => _MangaState();
}

class _MangaState extends State<Manga> with AutomaticKeepAliveClientMixin {
  final ScrollController bodyScrollController = ScrollController();
  final ScrollController previewScrollController = ScrollController();
  final ScrollController trendingScrollController = ScrollController();
  final ScrollController mostRecentScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: bodyScrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 31.5.h,
            child: buildPreview(),
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
          ),
          SizedBox(
            height: 39.5.h,
            child: buildPopularMovies(),
          ),
          SizedBox(height: 3.0.h),
          ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Trending Mangas of the Week',
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
            child: buildTrendingManga(),
          ),
        ],
      ),
    );
  }

  buildPopularMovies() {
    return FutureBuilder(
      future: Provider.of<PopularMangaProvider>(context, listen: false)
          .fetchAndSetPopularMovieItems("manga", 4),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingIndicator(context);
        } else if (snapshot.error == null) {
          return Consumer<PopularMangaProvider>(
            builder: (context, kitsu, _) {
              return ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                controller: mostRecentScrollController,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () => Navigate.pushPage(
                        context,
                        Details(
                          movie: kitsu.kitsuItems[index],
                        ),
                      ),
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
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: kitsu.kitsuItems[index].coverImage!.isEmpty
                                  ? Container(color: Colors.orange)
                                  : Image.network(
                                      kitsu.kitsuItems[index].coverImage!,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return loadingIndicator(context);
                                      },
                                    ),
                            ),
                          ),
                          Text(
                            kitsu.kitsuItems[index].title!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Constants.lightAccent
                                  : Constants.blueAccent,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).fadeInList(index, true);
                },
              );
            },
          );
        }
        return MyErrorWidget(
          refreshCallBack: () =>
              Provider.of<PopularMangaProvider>(context, listen: false)
                  .fetchAndSetPopularMovieItems("manga", 4),
        );
      },
    );
  }

  buildTrendingManga() {
    return FutureBuilder(
      future: Provider.of<TrendingAnimesProvider>(context, listen: false)
          .fetchAndSetMovieItems("manga", 6),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingIndicator(context);
        } else if (snapshot.error == null) {
          return Consumer<TrendingAnimesProvider>(
            builder: (context, kitsu, _) {
              return ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                controller: trendingScrollController,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => Navigate.pushPage(
                            context,
                            Details(
                              movie: kitsu.kitsuTrendingItems[index],
                            ),
                          ),
                          child: Container(
                            height: 30.0.h,
                            width: MediaQuery.of(context).size.width > 1200
                                ? 30.0.w
                                : 30.0.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Constants.blueAccent,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: kitsu.kitsuTrendingItems[index].coverImage!
                                      .isEmpty
                                  ? Container(color: Colors.orange)
                                  : Image.network(
                                      kitsu.kitsuTrendingItems[index]
                                          .coverImage!,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return loadingIndicator(context);
                                      },
                                    ),
                            ),
                          ),
                        ),
                        Text(
                          kitsu.kitsuTrendingItems[index].title!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Constants.lightAccent
                                    : Constants.blueAccent,
                            fontSize: 16.0,
                          ),
                        ),
                        const Text(
                          'Manga',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ).fadeInList(index, false);
                },
              );
            },
          );
        }
        return MyErrorWidget(
          refreshCallBack: () =>
              Provider.of<TrendingAnimesProvider>(context, listen: false)
                  .fetchAndSetMovieItems("manga", 4),
        );
      },
    );
  }

  buildPreview() {
    return FutureBuilder(
      future: Provider.of<FeaturedAnimesProvider>(context, listen: false)
          .fetchAndSetMovieItems("anime", 4),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingIndicator(context);
        } else if (snapshot.error == null) {
          return Consumer<FeaturedAnimesProvider>(
            builder: (context, kitsu, _) {
              return ListView.builder(
                itemCount: kitsu.kitsuItems.length,
                scrollDirection: Axis.horizontal,
                controller: previewScrollController,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                      onTap: () => Navigate.pushPage(
                        context,
                        Details(
                          movie: kitsu.kitsuItems[index],
                        ),
                      ),
                      child: Container(
                        height: 30.0.h,
                        width: MediaQuery.of(context).size.width > 1200
                            ? 35.0.w
                            : 35.0.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: kitsu.kitsuItems[index].coverImage!.isEmpty
                              ? Container(color: Colors.orange)
                              : Image.network(
                                  kitsu.kitsuItems[index].coverImage!,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ).fadeInList(index, false);
                },
              );
            },
          );
        }
        return MyErrorWidget(refreshCallBack: () {
          setState(() {
            Provider.of<FeaturedAnimesProvider>(context, listen: false)
                .fetchAndSetMovieItems("anime", 4);
          });
        });
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
