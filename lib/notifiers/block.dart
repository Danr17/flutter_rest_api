import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_rest_api/model/item.dart';
import 'package:http/http.dart' as http;

class BlockItem with ChangeNotifier {

  int _currentTab = 0;
  get currentTab => this._currentTab;
  set currentTab(int value) {
    this._currentTab = value;
    notifyListeners();
  }

  List<List<Item>> _items;
  List<List<Item>> get listitems => _items;
  set listitems(List<List<Item>> val) {
    _items = val;
    notifyListeners();
  }

  Future<List<List<Item>>> fetchItems() async {
    final response = await http.get('https://meds.dev-state.com/json/');

    List res = jsonDecode(response.body);
    List<Item> dataAll = [];
    List<Item> dataChild = [];
    List<Item> dataAdult = [];

    for (var i = 0; i < res.length; i++) {
      var item = Item.fromJson(res[i]);
      switch (item.targetAge) {
        case "adult":
        dataAll.add(item);
        dataAdult.add(item);
        break;
        case "child":
        dataAll.add(item);
        dataChild.add(item);
      }
    }

    listitems = [dataAll, dataChild, dataAdult];
    return listitems;
  }
}
