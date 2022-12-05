import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class NyanyianRohaniFirebaseUser {
  NyanyianRohaniFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

NyanyianRohaniFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<NyanyianRohaniFirebaseUser> nyanyianRohaniFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<NyanyianRohaniFirebaseUser>(
      (user) {
        currentUser = NyanyianRohaniFirebaseUser(user);
        return currentUser!;
      },
    );
