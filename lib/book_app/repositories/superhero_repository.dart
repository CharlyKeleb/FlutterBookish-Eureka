import 'dart:convert';

import 'package:flutter_web_projects/utils/endpoints.dart';
import 'package:http/http.dart' as http;

class SuperHeroRepository {
  Future<List> getSuperHeroes() async {
    var res = await http.get(
      Uri.parse(Endpoints.superHeroUrl),
    );
    if (res.statusCode == 200) {
      print('>>>>>>> ${res.body}');
      return jsonDecode(res.body);
    } else {
      print('>>>>>>> ${res.body}');
      throw (jsonDecode(res.body));
    }
  }
}
