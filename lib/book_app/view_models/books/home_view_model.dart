import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_projects/book_app/enum/api_request_status.dart';
import 'package:flutter_web_projects/book_app/models/category.dart';
import 'package:flutter_web_projects/utils/endpoints.dart';
import 'package:flutter_web_projects/utils/util.dart';

class HomeProvider with ChangeNotifier {
  CategoryModel top = CategoryModel();
  CategoryModel recent = CategoryModel();
  APIRequestStatus apiRequestStatus = APIRequestStatus.loading;

  Endpoints api = Endpoints();

  getFeeds() async {
    setApiRequestStatus(APIRequestStatus.loading);
    try {
      CategoryModel popular = await api.getCategory(Endpoints.popular);
      setTop(popular);
      CategoryModel newReleases = await api.getCategory(Endpoints.recent);
      setRecent(newReleases);
      setApiRequestStatus(APIRequestStatus.loaded);
    } catch (e) {
      print('ERRORRRR $e');
      checkError(e);
    }
  }

  void checkError(e) {
    if (Util.isConnectionError(e)) {
      setApiRequestStatus(APIRequestStatus.connectionError);
    } else {
      setApiRequestStatus(APIRequestStatus.error);
    }
  }

  void setApiRequestStatus(APIRequestStatus value) {
    apiRequestStatus = value;
    notifyListeners();
  }

  void setTop(value) {
    top = value;
    notifyListeners();
  }

  CategoryModel getTop() {
    return top;
  }

  void setRecent(value) {
    recent = value;
    notifyListeners();
  }

  CategoryModel getRecent() {
    return recent;
  }
}
