import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_projects/book_app/models/category.dart';
import 'package:flutter_web_projects/utils/endpoints.dart';

class DetailsProvider extends ChangeNotifier {
  CategoryModel related = CategoryModel();

  bool loading = true;
  Entry? entry;

  Endpoints api = Endpoints();

  getFeed(String url) async {
    setLoading(true);
    try {
      CategoryModel feed = await api.getCategory(url);
      setRelated(feed);
      setLoading(false);
    } catch (e) {
      rethrow;
    }
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setRelated(value) {
    related = value;
    notifyListeners();
  }

  CategoryModel getRelated() {
    return related;
  }

  void setEntry(value) {
    entry = value;
    notifyListeners();
  }
}
