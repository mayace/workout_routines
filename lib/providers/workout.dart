import 'package:flutter/cupertino.dart';

class Workout with ChangeNotifier {
  List<String> routines = [];

  void add(String name) {
    routines.add("${routines.length} - $name");
    notifyListeners();
  }

  void remove(String name) {
    routines.remove(name);
    notifyListeners();
  }

  void clear() {
    routines.clear();
    notifyListeners();
  }
}
