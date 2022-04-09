import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'interests_class.dart';

class InterestsData extends ChangeNotifier {
  final List<Interests> _Interests = [];

  int get InterestCount {
    return _Interests.length;
  }

  // List<Interests> _selectedInterests = [];

  @override
  void initState() {
    interests;
    notifyListeners();
  }

  UnmodifiableListView<Interests> get interests {
    return UnmodifiableListView(_Interests);
  }

  void addInterests(String newInterestsTitle) {
    final interests = Interests(name: newInterestsTitle);
    _Interests.add(interests);
    notifyListeners();
  }

  void deleteInterests(Interests interests) {
    _Interests.remove(interests);
    notifyListeners();
  }
}
