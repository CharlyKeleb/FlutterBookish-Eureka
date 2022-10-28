import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_web_projects/utils/endpoints.dart';
import 'package:http/http.dart' as http;

class SuperHeroViewModel extends ChangeNotifier {
  List superHero = [];
  bool loading = false;

  fetchSuperHeroes() async {
    loading = true;
    notifyListeners();
    final response = await http.get(Uri.parse(Endpoints.superHeroUrl));

    if (response.statusCode == 200) {
        superHero = json.decode(response.body);
        loading = false;
        notifyListeners();
    } else {
      throw Exception('Failed to Load');
    }
  }
}
