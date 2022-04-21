import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Datas {
  addToHistory(product) async {
    final prefs = await SharedPreferences.getInstance();
    List<dynamic> data = List();
    if (prefs.getString('history') != null) {
      var res = json.decode(prefs.getString('history'));
      res.forEach((element) {
        data.add(element);
      });
      data.add(product);
      // this.history = data.length;
      prefs.setString("history", json.encode(data));
    } else {
      data.add(product);
      prefs.setString("history", json.encode(data));
    }
  }

  gethistory() async {
    final prefs = await SharedPreferences.getInstance();
    // List<Map<String, dynamic>> data;
    if (prefs.getString('history') != null) {
      return json.decode(prefs.getString('history'));
    } else {
      return [];
    }
  }

  void clear() async {
    final prefs = await SharedPreferences.getInstance();
    // var res = json.decode(prefs.getString('user'));
    prefs.remove('history');
  }
}
