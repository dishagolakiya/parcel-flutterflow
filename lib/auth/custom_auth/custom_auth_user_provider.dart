import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class ParcelV10AuthUser {
  ParcelV10AuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<ParcelV10AuthUser> parcelV10AuthUserSubject =
    BehaviorSubject.seeded(ParcelV10AuthUser(loggedIn: false));
Stream<ParcelV10AuthUser> parcelV10AuthUserStream() => parcelV10AuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
