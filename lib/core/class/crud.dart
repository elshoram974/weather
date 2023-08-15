import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/model/search_model.dart';
import '../constants/links.dart';

abstract class CRUD {
  static Future<List<String>> getQ(String q) async {
    List<String> suggestions = [];
    List<Search> search = [];
    Uri url = Uri.parse(AppLinks.search(q));
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> allData = jsonDecode(response.body);

      for (Map<String, dynamic> data in allData) {
        search.add(Search.fromJson(data));
        suggestions.add(search.last.name);
      }
    } else {
      throw 'failed to search';
    }
    return suggestions;
  }
}
