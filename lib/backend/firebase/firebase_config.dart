import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDttwvI0SZPS9htzIc6EGNFft_mntw4eTY",
            authDomain: "inptic-apps-cc69a.firebaseapp.com",
            projectId: "inptic-apps-cc69a",
            storageBucket: "inptic-apps-cc69a.appspot.com",
            messagingSenderId: "1058308240936",
            appId: "1:1058308240936:web:b30325bd54f971a2af271d",
            measurementId: "G-DVSW83FZ1J"));
  } else {
    await Firebase.initializeApp();
  }
}
