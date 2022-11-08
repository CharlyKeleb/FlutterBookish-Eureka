import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_web_projects/Theme/theme.dart';
import 'package:flutter_web_projects/book_app/components/body_builder.dart';
import 'package:flutter_web_projects/book_app/components/loading_indicator.dart';
import 'package:flutter_web_projects/book_app/components/navigate.dart';
import 'package:flutter_web_projects/book_app/models/category.dart';
import 'package:flutter_web_projects/book_app/view_models/books/home_view_model.dart';
import 'package:flutter_web_projects/book_app/views/Books/book_details.dart';
import 'package:flutter_web_projects/book_app/views/Books/category/category_screen.dart';
import 'package:flutter_web_projects/utils/constants.dart';
import 'package:flutter_web_projects/utils/extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) => Provider.of<HomeProvider>(context, listen: false).getFeeds(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (BuildContext context, HomeProvider viewModel, Widget? child) {
      return BodyBuilder(
        apiRequestStatus: viewModel.apiRequestStatus,
        reload: () => viewModel.getFeeds(),
        child: SingleChildScrollView(
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
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              SizedBox(
                height: 45.0.h,
                child: buildPopularBooks(viewModel),
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
              buildCategories(viewModel),
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
                height: 45.0.h,
                child: buildNewReleases(viewModel),
              ),
            ],
          ),
        ),
      );
    });
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
              borderRadius: BorderRadius.circular(5.0),
              color: Constants.blueAccent,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Build your reading library',
                        style: GoogleFonts.orelegaOne(
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(height: 1.0.h),
                      const Text(
                        'Read your favorite book for free.\nWe will also provide you with your favorite Anime and Manga Characters.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
                              Colors.white,
                            ),
                          ),
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              'Have fun Exploring',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (MediaQuery.of(context).size.width > 1200)
                  SizedBox(width: 15.w),
                if (MediaQuery.of(context).size.width > 1200)
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.asset(
                              'assets/images/book2.jpg',
                              height: 500.0,
                              width: 200.0,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                    ).fadeInList(0, false),
                  ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            'assets/images/book0.jpg',
                            height: 500.0,
                            width: MediaQuery.of(context).size.width > 1200
                                ? 495.0
                                : 400.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ).fadeInList(1, false),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildPopularBooks(HomeProvider viewModel) {
    return ListView.builder(
      itemCount: viewModel.top.feed?.entry?.length ?? 0,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        final String imgTag = uuid.v4();
        final String titleTag = uuid.v4();
        final String authorTag = uuid.v4();
        Entry entry = viewModel.top.feed!.entry![index];
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () => Navigate.pushPage(
              context,
              BookDetails(
                entry: entry,
                authorTag: authorTag,
                imgTag: imgTag,
                titleTag: titleTag,
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 36.0.h,
                  width: MediaQuery.of(context).size.width > 1200
                      ? 14.0.w
                      : 17.0.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Constants.blueAccent,
                  ),
                  child: Hero(
                    tag: imgTag,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: entry.link![1].href!.isEmpty
                          ? Container(color: Colors.orange)
                          : FadeInImage.assetNetwork(
                              image: entry.link![1].href!,
                              fit: BoxFit.cover,
                              placeholder: 'assets/images/placeholder.jpg',
                            ),
                    ),
                  ),
                ),
                Hero(
                  tag: titleTag,
                  child: Text(
                    entry.title!.t!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Constants.lightAccent
                          : Constants.blueAccent,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Hero(
                  tag: authorTag,
                  child: Text(
                    entry.author!.name!.t.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  buildCategories(HomeProvider viewModel) {
    return SizedBox(
      height: 6.0.h,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.top.feed?.link?.length ?? 0,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          Link link = viewModel.top.feed!.link![index];
          if (index < 10) {
            return const SizedBox();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Constants.blueAccent,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                onTap: () {
                  Navigate.pushPage(
                    context,
                    CategoryScreen(
                      title: '${link.title}',
                      url: link.href,
                    ),
                  );
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      '${link.title}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ).fadeInList(index, false);
        },
      ),
    );
  }

  buildNewReleases(HomeProvider viewModel) {
    return ListView.builder(
      itemCount: viewModel.recent.feed?.entry?.length ?? 0,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        final String imgTag = uuid.v4();
        final String titleTag = uuid.v4();
        final String authorTag = uuid.v4();
        Entry entry = viewModel.recent.feed!.entry![index];
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () => Navigate.pushPage(
              context,
              BookDetails(
                entry: entry,
                authorTag: authorTag,
                imgTag: imgTag,
                titleTag: titleTag,
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 37.0.h,
                  width: MediaQuery.of(context).size.width > 1200
                      ? 14.0.w
                      : 17.0.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Constants.blueAccent,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: entry.link![1].href!.isEmpty
                        ? Container(color: Colors.orange)
                        : FadeInImage.assetNetwork(
                            image: entry.link![1].href!,
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/placeholder.jpg',
                          ),
                  ),
                ),
                Text(
                  entry.title!.t!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Constants.lightAccent
                        : Constants.blueAccent,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  entry.author!.name!.t.toString(),
                  style: const TextStyle(
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

  @override
  bool get wantKeepAlive => true;
}
