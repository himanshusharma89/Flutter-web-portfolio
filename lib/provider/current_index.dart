import 'package:flutter/foundation.dart';

class CurrentPage extends ChangeNotifier {
  int _currentPage = 0;
  int get currentPage => _currentPage;

  void setCurrentPage(int val) {
    _currentPage = val;
    notifyListeners();
  }
}
