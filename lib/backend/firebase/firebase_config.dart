import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDy9XI3lfP-S9MvCI3HoNlai2v5MrQKjUs",
            authDomain: "jansakti-1aea3.firebaseapp.com",
            projectId: "jansakti-1aea3",
            storageBucket: "jansakti-1aea3.appspot.com",
            messagingSenderId: "629173650503",
            appId: "1:629173650503:web:014f100870574ce3961d62",
            measurementId: "G-TWYG755F90"));
  } else {
    await Firebase.initializeApp();
  }
}
