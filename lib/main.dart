import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:video_encoder/app/app.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          projectId: 'instrive-video-editor',
          apiKey: 'AIzaSyCNmmw5jFm0ZxUEZ4c98eu6pQIywSeX8OA',
          messagingSenderId: '366043896419',
          appId: '1:366043896419:android:863b49e654e23e842c3656',
          storageBucket: "instrive-video-editor.appspot.com",
      )
  );

  runApp(App());
}
