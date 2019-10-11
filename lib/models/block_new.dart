import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_rest_api/models/item.dart';
import 'package:http/http.dart' as http;

class BlockItem with ChangeNotifier {

  List<Item> _items;
  List<Item> get listitems => _items;
  set listitems(List<Item> val) {
    _items = val;
    notifyListeners();
  }

  Future<List<Item>> fetchItems() async {
    final response = await http.get('https://meds.dev-state.com/json/');

    List res = jsonDecode(response.body);
    List<Item> dataAll = [];

    for (var i = 0; i < res.length; i++) {
      var item = Item.fromJson(res[i]);
      dataAll.add(item);
    }

    listitems = dataAll;
    return listitems;
  }
}