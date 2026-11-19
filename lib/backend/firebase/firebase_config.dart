import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB33iqyE2hb6NAq1KmVifPCHWAu3Gk2Hgc",
            authDomain: "aecap-560c5.firebaseapp.com",
            projectId: "aecap-560c5",
            storageBucket: "aecap-560c5.firebasestorage.app",
            messagingSenderId: "944891657168",
            appId: "1:944891657168:web:a9e33bc72b895f32cf17d5",
            measurementId: "G-LZTYQRHDB4"));
  } else {
    await Firebase.initializeApp();
  }
}
