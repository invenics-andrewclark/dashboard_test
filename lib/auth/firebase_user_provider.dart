import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class JanDashDuplicateFirebaseUser {
  JanDashDuplicateFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

JanDashDuplicateFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<JanDashDuplicateFirebaseUser> janDashDuplicateFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<JanDashDuplicateFirebaseUser>(
      (user) {
        currentUser = JanDashDuplicateFirebaseUser(user);
        return currentUser!;
      },
    );
