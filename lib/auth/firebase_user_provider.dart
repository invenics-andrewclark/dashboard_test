import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class JanasktiDashboardDevFirebaseUser {
  JanasktiDashboardDevFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

JanasktiDashboardDevFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<JanasktiDashboardDevFirebaseUser>
    janasktiDashboardDevFirebaseUserStream() => FirebaseAuth.instance
            .authStateChanges()
            .debounce((user) => user == null && !loggedIn
                ? TimerStream(true, const Duration(seconds: 1))
                : Stream.value(user))
            .map<JanasktiDashboardDevFirebaseUser>(
          (user) {
            currentUser = JanasktiDashboardDevFirebaseUser(user);
            return currentUser!;
          },
        );
