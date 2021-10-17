import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voice_rec/app/providers/speech_recognition_provider.dart';
import 'app/view/page/speech_recognition_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Voice recognition app',
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider<SpeechRecognitionProvider>(create: (_) => SpeechRecognitionProvider(), child: SpeechScreen()));
  }
}
