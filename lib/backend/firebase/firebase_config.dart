import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCLqZNOoGVc60Qa2WD5BeqY_gWfJ4LN8C4",
            authDomain: "parcel-v-1-0.firebaseapp.com",
            projectId: "parcel-v-1-0",
            storageBucket: "parcel-v-1-0.appspot.com",
            messagingSenderId: "26428529898",
            appId: "1:26428529898:web:2893bf5d2382185772cb93",
            measurementId: "G-B24S2FCKLS"));
  } else {
    await Firebase.initializeApp();
  }
}
