import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_web_projects/book_app/models/kitsu.dart';
import 'package:flutter_web_projects/utils/endpoints.dart';
import 'package:http/http.dart' as http;


class PopularMangaProvider with ChangeNotifier {
  List<KitsuModel> kitsuItems = <KitsuModel>[];

  List<KitsuModel> get movieItems {
    return [...kitsuItems];
  }

  Future<void> fetchAndSetPopularMovieItems(String category, int offset,
      [int limit = 10]) async {
    final url =
        "${Endpoints.kitsuUrl}/manga?page[limit]=$limit&page[offset]=$offset&sort=popularityRank";
    final response = await http.get(Uri.parse(url));
    final responseData = jsonDecode(response.body)["data"] as List<dynamic>;

    kitsuItems.clear();
    for (var animeItem in responseData) {
      kitsuItems.add(KitsuModel.fromJson(animeItem));
    }
    for (var animeItem in kitsuItems) {
    }
    notifyListeners();
  }

  void changeSignal() {
    notifyListeners();
  }
}