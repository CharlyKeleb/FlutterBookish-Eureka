import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_web_projects/book_app/models/kitsu.dart';
import 'package:flutter_web_projects/utils/endpoints.dart';
import 'package:http/http.dart' as http;

class TrendingAnimesProvider with ChangeNotifier {
  final List<KitsuModel> kitsuTrendingItems = <KitsuModel>[];

  List<KitsuModel> get movieItems {
    return [...kitsuTrendingItems];
  }

  Future<void> fetchAndSetMovieItems(String category, int offset,
      [int limit = 10]) async {
    final url =
        "${Endpoints.kitsuUrl}/trending/$category?page[limit]=$limit&page[offset]=$offset";

    final response = await http.get(Uri.parse(url));
    final responseData = jsonDecode(response.body)["data"] as List<dynamic>;
    kitsuTrendingItems.clear();
    for (var kitsuItem in responseData) {
      kitsuTrendingItems.add(KitsuModel.fromJson(kitsuItem));
    }
    for (var animeItem in kitsuTrendingItems) {}
    notifyListeners();
  }

  void changeSignal() {
    notifyListeners();
  }
}
