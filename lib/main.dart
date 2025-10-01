// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    // For web, Firebase is initialized in index.html
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDwZLjn6n1ViNK6HKcjhe1zgSZMUYBLX24",
        authDomain: "auth-ffe62.firebaseapp.com",
        projectId: "auth-ffe62",
        storageBucket: "auth-ffe62.firebasestorage.app",
        messagingSenderId: "521783194977",
        appId: "1:521783194977:web:a9962fa436b7a67f45c120",
      ),
    );
  } else {
    // For Android/iOS, use google-services.json/GoogleService-Info.plist
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const SplashScreen(),
    );
  }
}
