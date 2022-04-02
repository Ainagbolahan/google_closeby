// import 'dart:collection';
//
// import 'package:flutter/foundation.dart';
//
// import 'interests_class.dart';
//
//
// class InterestsData extends ChangeNotifier {
//   static List<Interests> _Interests = [
//     Interests(name: 'Helping neighbours'),
//     Interests(name: 'Paid tasket'),
//     Interests(name: 'Events'),
//     Interests(name: 'Free Giveaway'),
//     Interests(name: 'Pets'),
//     Interests(name: 'Shopping'),
//     Interests(name: 'Hangout'),
//     Interests(name: 'Gigs'),
//     Interests(name: 'Paid/Free trips'),
//     Interests(name: 'Books'),
//     Interests(name: 'Sports'),
//     Interests(name: 'Movie'),
//     Interests(name: 'Travel'),
//     Interests(name: 'Chatting'),
//     Interests(name: 'BabySitting'),
//     Interests(name: 'Art'),
//   ];
//
//   List<Interests> _selectedInterests = [];
//
//   @override
//   void initState() {
//     _selectedInterests = _Interests;
//     notifyListeners();
//   }
//
//   UnmodifiableListView<Interests> get interests {
//     return UnmodifiableListView(_Interests);
//   }
//
//   int get InterestCount {
//     return _Interests.length;
//   }
//
//   final _items =
//       _Interests.map((e) => MultiSelectItem<Interests>(e, e.name)).toList();
//
//   List<MultiSelectItem<Interests>> get items {
//     return _items;
//   }
//
//   void addInterests(String newInterestsTitle) {
//     final interests = Interests(name: newInterestsTitle);
//     _Interests.add(interests);
//     notifyListeners();
//   }
//
//   void updateInterests(Interests interests) {
//     interests.toggleDone();
//     notifyListeners();
//   }
//
//   void deleteInterests(Interests interests) {
//     _Interests.remove(interests);
//     notifyListeners();
//   }
// }
//
// class MultiSelectItem {
// }
