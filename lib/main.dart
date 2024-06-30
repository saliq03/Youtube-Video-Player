import 'dart:io';

import 'package:flutter/material.dart';
import 'package:youtube_video_player/Home.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBhiIBb4TMwTXi3v5L-NQGInyI1VFcY1oI",
          appId: "1:802941698241:android:d8221987fd82d709f75440",
          messagingSenderId:"802941698241",
          projectId: "video-player-4b20d")):
    await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:Home()
    );
  }
}

