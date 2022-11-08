import 'package:flutter_web_projects/book_app/view_models/animes/anime_view_model.dart';
import 'package:flutter_web_projects/book_app/view_models/animes/popular_anime_view_model.dart';
import 'package:flutter_web_projects/book_app/view_models/app/theme_provider.dart';
import 'package:flutter_web_projects/book_app/view_models/books/book_details_view_model.dart';
import 'package:flutter_web_projects/book_app/view_models/books/category_view_model.dart';
import 'package:flutter_web_projects/book_app/view_models/books/home_view_model.dart';
import 'package:flutter_web_projects/book_app/view_models/superhero/superhero_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../book_app/view_models/animes/trending_anime_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => SuperHeroViewModel()),
  ChangeNotifierProvider(create: (_) => FeaturedAnimesProvider()),
  ChangeNotifierProvider(create: (_) => TrendingAnimesProvider()),
  ChangeNotifierProvider(create: (_) => PopularMangaProvider()),
  ChangeNotifierProvider(create: (_) => DetailsProvider()),
  ChangeNotifierProvider(create: (_) => CategoryProvider()),
  ChangeNotifierProvider(create: (_) => HomeProvider()),
  ChangeNotifierProvider(create: (_) => AppProvider()),

];
